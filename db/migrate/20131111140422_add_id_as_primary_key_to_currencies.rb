class AddIdAsPrimaryKeyToCurrencies < ActiveRecord::Migration
  def up
    change_column :currencies, :code, :string
    add_column :currencies, :id, :primary_key
    add_index :currencies, :code, unique: true
  end

  def down
    remove_column :currencies, :id
    change_column :currencies, :code, :primary_key
  end
end
