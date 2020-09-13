class CreateBlogPosts < ActiveRecord::Migration[6.0]
  def change
    create_table :blog_posts, id: :uuid do |t|
      t.string :bg_color, null: false
      t.string :icon, null: false
      t.string :title, null: false, index: { unique: true }
      t.integer :status, default: 0, null: false
      t.date :publish_on
      t.references :user, null: false, foreign_key: true, type: :uuid

      t.timestamps
    end
  end
end
