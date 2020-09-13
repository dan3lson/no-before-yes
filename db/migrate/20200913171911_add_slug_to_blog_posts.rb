class AddSlugToBlogPosts < ActiveRecord::Migration[6.0]
  def change
    add_column :blog_posts, :slug, :string, unique: true
  end
end
