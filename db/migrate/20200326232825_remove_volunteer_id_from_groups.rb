class RemoveVolunteerIdFromGroups < ActiveRecord::Migration[6.0]
  def change

    remove_column :groups, :volunteer_id, :integer
  end
end
