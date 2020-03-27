class RemoveGroupIdFromVolunteers < ActiveRecord::Migration[6.0]
  def change

    remove_column :volunteers, :group_id, :integer
  end
end
