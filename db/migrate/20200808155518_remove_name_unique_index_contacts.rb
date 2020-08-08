class RemoveNameUniqueIndexContacts < ActiveRecord::Migration[6.0]
  def change
    remove_index :contacts, :name
    add_index :contacts, :name
  end
end
