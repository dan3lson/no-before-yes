class CreateContacts < ActiveRecord::Migration[6.0]
  def change
    create_table :contacts, id: :uuid do |t|
      t.string :name, null: false, index: { unique: true }
      t.string :website
      t.string :email
      t.string :phone_number
      t.string :note
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
