module RoomsHelper
  def self.label(room)
    "#{room.house}, #{room.floor_short}, Zimmer #{room.number}"
  end
end
