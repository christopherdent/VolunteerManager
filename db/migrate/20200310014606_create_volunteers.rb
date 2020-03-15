class CreateVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteers do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :organization
      t.string :sector
      t.boolean :active_status
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
