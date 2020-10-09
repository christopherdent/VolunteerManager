class CreateGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :groups do |t|
      t.text :name
      t.text :program_name
      t.text :chair_first
      t.text :chair_last
      t.boolean :status

      t.timestamps
    end
  end
end
