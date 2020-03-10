class CreateVolunteerGroups < ActiveRecord::Migration[6.0]
  def change
    create_table :volunteer_groups do |t|
      t.belongs_to :volunteer, null: false, foreign_key: true
      t.belongs_to :group, null: false, foreign_key: true

      t.timestamps
    end
  end
end
