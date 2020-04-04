class AddKindToGroups < ActiveRecord::Migration[6.0]
  def change
        add_column :groups, :kind, :string
  end
end
