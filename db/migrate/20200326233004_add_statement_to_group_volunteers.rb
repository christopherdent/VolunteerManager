class AddStatementToGroupVolunteers < ActiveRecord::Migration[6.0]
  def change
    add_column :group_volunteers, :statement, :string
  end
end
