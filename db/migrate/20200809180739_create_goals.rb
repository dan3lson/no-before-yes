class CreateGoals < ActiveRecord::Migration[6.0]
  def change
    create_table :goals, id: :uuid do |t|
      t.integer :target, null: false
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
