class CreateGroupVolunteers < ActiveRecord::Migration[6.0]
  def change
    create_table :group_volunteers do |t|
      t.belongs_to :group, index: true, foreign_key: true
      t.belongs_to :volunteer, index: true, foreign_key: true
      t.timestamps null: false
    end
  end
end
