class PdfRentContract < Prawn::Document

  IMAGE_WITH = 180
  IMAGE_HEIGHT = 52
  ADDRESS_Y_POS = 110

  def header(contract)
    x_pos = bounds.width-IMAGE_WITH
    y_pos = cursor
    image "#{Rails.root}/custom/logo.png", at: [x_pos, y_pos], 
                                           width: IMAGE_WITH
    text "M   I   E   T   V   E   R   T   R   A   G", size: 14, style: :bold
    move_down 5
    text "Mietvertragnummer: #{contract.start.year}-#{contract.start.month}/#{contract.room.house.first}/#{contract.room.number}", size: 8
    move_down 15
    text "Zwischen"
    move_down 5
    text "der <b>#{@texts['gmbh_name']}</b>, #{@texts['gmbh_street_no']}, #{@texts['gmbh_zip_code']} #{@texts['gmbh_city']} - als Vermieterin -", inline_format: true
    move_down 5
    text "und <b>#{contract.tenant.prename} #{contract.tenant.name}</b>, derzeit #{contract.tenant.current_street_no}, #{contract.tenant.current_zip_code_city} - als Mieter_in -", inline_format: true
    move_down 10
    text "wird folgender Mietvertrag geschlossen:"
  end

  def left_column(contract)
  end

  def right_column(contract)
  end

  def footer
    self.line_width = 0.5
    y_pos = 80
    stroke_line [0, y_pos], [bounds.width, y_pos]
    y_pos -= 5
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
      text @texts['bank_name'], size: 8
      text @texts['bank_account_info'], size: 8
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
    super(page_size: 'A4', top_margin: 30, left_margin: 55)
    @contracts = contracts
    @view = view

    hash = YAML.load_file("#{Rails.root}/custom/text_snippets.yml")
    @texts = HashWithIndifferentAccess.new(hash)

    font 'Helvetica'

    width = bounds.width + 65

    @contracts.each_with_index do |contract, index|
      start_new_page unless index == 0

      header contract
      left_column contract
      right_column contract
      footer
    end
  end
end
