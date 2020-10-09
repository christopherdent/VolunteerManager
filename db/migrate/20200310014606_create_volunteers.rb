class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.text :first_name
      t.text :last_name
      t.text :email
      t.text :organization
      t.text :sector
      t.boolean :active_status
      
      t.timestamps
    end
  end
end
