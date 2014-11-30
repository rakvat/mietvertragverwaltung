class PdfRentContract < Prawn::Document
  include RentsHelper

  IMAGE_WITH = 180
  IMAGE_HEIGHT = 52
  ADDRESS_Y_POS = 110
  LINE_HEIGHT = 10
  PARAGRAPH_HEIGHT = 15
  BELOW_HEADER_HEIGHT = 5

  def header(contract)
    x_pos = bounds.width-IMAGE_WITH
    y_pos = cursor + 20
    image "#{Rails.root}/custom/logo.png", at: [x_pos, y_pos], 
                                           width: IMAGE_WITH
    text "M   I   E   T   V   E   R   T   R   A   G", size: 14, style: :bold
    move_down LINE_HEIGHT
    update = ''
    unless contract.previous_contract.nil?
      update =  "  –  aktualisiert Mietvertrag: #{contract.previous_contract.identifier} "
    end
    text "Mietvertragnummer: #{contract.identifier}#{update}", size: 8
    move_down 15
    text "Zwischen"
    move_down LINE_HEIGHT
    text "der <b>#{@texts['gmbh_name']}</b>, #{@texts['gmbh_street_no']}, #{@texts['gmbh_zip_code']} #{@texts['gmbh_city']} - als Vermieterin -", inline_format: true
    move_down LINE_HEIGHT
    text "und <b>#{contract.tenant.prename} #{contract.tenant.name}</b>, derzeit #{contract.tenant.current_street_no}, #{contract.tenant.current_zip_code_city} - als Mieter_in -", inline_format: true
    move_down 10
    text "wird folgender Mietvertrag geschlossen:"
    move_down 20
  end

  def left_column(contract)
    bounding_box [0, @column_y], width: @width/2.0 do
      text "1. Mieträume", style: :bold
      move_down BELOW_HEADER_HEIGHT
      if contract.is_office
        text @texts['office_location']
      else
        text @texts['rooms_location']
      end
      move_down LINE_HEIGHT
      text contract.rooms.map { |r| RoomsHelper::label(r) }.join('; '), style: :bold
      text "Größe: #{contract.square_meters} m²", style: :bold
      move_down LINE_HEIGHT
      text @texts['rooms_rent_type']
      move_down PARAGRAPH_HEIGHT

      text "2. Mietzeit", style: :bold
      move_down BELOW_HEADER_HEIGHT
      text "Das Mietverhältnis ist von unbestimmter Dauer und beginnt mit dem <b>#{date(contract.start)}</b>", inline_format: true
      text "Es kann von beiden Vertragsparteien im Rahmen der gesetzlichen Bestimmungen und Fristen gekündigt werden, falls nichts anderes vereinbart ist."
      move_down PARAGRAPH_HEIGHT

      text "3. Miete", style: :bold
      move_down BELOW_HEADER_HEIGHT
      text "Die Nettokaltmiete beträgt monatlich <b>#{price(contract.basic_rent)}</b>", inline_format: true
      move_down LINE_HEIGHT
      text "Zusätzlich ist eine monatliche Vorauszahlung für Heiz- und Nebenkosten zu entrichten:"
      text "Heizung/Warmwasser: #{price(contract.custom_heating.nil? ? contract.heating_charges : contract.custom_heating)}"
      text "Sonstige Nebenkosten: #{price(contract.custom_assessory.nil? ? contract.assessory_charges : contract.custom_assessory)}"
      text "Summe Nebenkosten: <b>#{price(contract.sum_assessory_charges)}</b>", inline_format: true
      move_down 5
      text "Gesamtmiete: #{price(contract.sum_rent)}", style: :bold
    end
  end

  def right_column(contract)
    bounding_box [@width/2.0 + 20, @column_y], width: @width/2.0 do
      text "Die Nebenkosten werden anteilig in Höhe der tatsächlich entstandenen Kosten jährlich abgerechnet und auf die Mieter_innen umgelegt unter Anrechnung der monatlichen Vorauszahlungen."
      text "Nettokaltmiete und Nebenkosten (Gesamtmiete) sind monatlich im voraus zu zahlen auf das Konto der"
      move_down LINE_HEIGHT
      text @texts['gmbh_name'], style: :bold
      text "#{@texts['gmbh_bank_name']}, BIC: #{@texts['gmbh_bank_bic']}", style: :bold
      text "IBAN: #{@texts['gmbh_bank_iban']}", style: :bold
      move_down PARAGRAPH_HEIGHT

      text "4. Reparaturen", style: :bold
      move_down BELOW_HEADER_HEIGHT
      text "Die Instandhaltung besorgt die Vermieterin. Die Schönheitsreparaturen (Anstrich usw.) bzw. deren Kosten übernimmt der_die Mieter_in."
      move_down PARAGRAPH_HEIGHT

      text "5. Umgang mit dem Wohnraum", style: :bold
      move_down BELOW_HEADER_HEIGHT
      text contract.rooms.first.security_hint
    end
  end

  def footer
    self.line_width = 0.5
    y_pos = 90
    stroke_line [0, y_pos], [bounds.width, y_pos]
    y_pos -= 10 
    bounding_box [20, y_pos], width: bounds.width/2.0 do
      text "#{@texts['gmbh_city']}, den ________________________________", size: 10
      move_down 5
      text "__________________________________"
      text "#{@texts['gmbh_name']} - Vermieterin", size: 8
    end
    bounding_box [20 + bounds.width/2.0, y_pos], width: bounds.width/2.0 do
      text "#{@texts['gmbh_city']}, den ________________________________", size: 10
      move_down 5
      text "__________________________________"
      text "Mieter_in", size: 8
    end
    
    y_pos = 25
    stroke_line [0, y_pos], [bounds.width, y_pos]
    fill_color '777777'
    y_pos -= 5
    bounding_box [20, y_pos], width: bounds.width/3.0 do
      text "#{@texts['gmbh_bank_name']}, BIC: #{@texts['gmbh_bank_bic']}", size: 8
      text "IBAN: #{@texts['gmbh_bank_iban']}", size: 8
    end
    bounding_box [20 + bounds.width/3.0, y_pos], width: bounds.width/3.0 do
      text "Geschäftsführung", size: 8
      text @texts['gmbh_executive_board'], size: 8
    end
    bounding_box [20 + 2*bounds.width/3.0, y_pos], width: bounds.width/3.0 do
      text "Registergericht: #{@texts['gmbh_register_number']}", size: 8
      text "Steuernummer: #{@texts['gmbh_tax_number']}", size: 8
    end
  end

  def initialize(contracts, view)
    super(page_size: 'A4', top_margin: 45, left_margin: 55)
    @contracts = contracts
    @view = view

    hash = YAML.load_file("#{Rails.root}/custom/text_snippets.yml")
    @texts = HashWithIndifferentAccess.new(hash)

    font 'Helvetica'

    @width = bounds.width - 20

    @contracts.each_with_index do |contract, index|
      start_new_page unless index == 0

      header contract
      @column_y = cursor
      left_column contract
      right_column contract
      footer
    end
  end
end
