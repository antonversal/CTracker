class AddIdAsPrimaryKeyToCountries < ActiveRecord::Migration
  def up
    change_column :countries, :code, :string
    add_column :countries, :id, :primary_key
    add_index :countries, :code, unique: true
  end

  def down
    remove_column :countries, :id
    change_column :countries, :code, :primary_key
  end
end
