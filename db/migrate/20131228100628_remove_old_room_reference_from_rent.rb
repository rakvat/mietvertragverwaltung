class RemoveOldRoomReferenceFromRent < ActiveRecord::Migration
  def change
    remove_column :rents, :room_id
  end
end
