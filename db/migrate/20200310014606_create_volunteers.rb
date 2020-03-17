class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :organization
      t.string :sector
      t.boolean :active_status
      
      t.timestamps
    end
  end
end
