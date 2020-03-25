class AddVolunteerIdToGroups < ActiveRecord::Migration[6.0]
  def change
    add_column :groups, :volunteer_id, :integer
  end
end
