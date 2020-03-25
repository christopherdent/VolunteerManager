class AddGroupIdToVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :volunteers, :group_id, :integer
  end
end
