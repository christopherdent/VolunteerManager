class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.string :name
      t.string :program_name
      t.string :chair_first
      t.string :chair_last
      t.boolean :status

      t.timestamps
    end
  end
end
