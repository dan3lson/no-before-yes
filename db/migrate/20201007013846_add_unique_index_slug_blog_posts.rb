class AddUniqueIndexSlugBlogPosts < ActiveRecord::Migration[6.0]
  def change
    remove_index :blog_posts, :slug if index_exists?(:blog_posts, :slug)
    add_index :blog_posts, :slug, unique: true
  end
end
