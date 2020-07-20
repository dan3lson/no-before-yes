class CreateTouchpoints < ActiveRecord::Migration[6.0]
  def change
    create_table :touchpoints, id: :uuid do |t|
      t.text :recap, null: false
      t.date :follow_up_on, null: false
      t.integer :source, null: false, default: 0
      t.integer :result, null: false, default: 0
      t.references :user, null: false, foreign_key: true, type: :uuid
      t.references :contact, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
