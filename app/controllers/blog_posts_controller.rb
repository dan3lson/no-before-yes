# frozen_string_literal: true

class BlogPostsController < ApplicationController
  skip_before_action :require_login

  def index
    @published_blog_posts = BlogPost.published.latest
  end

  def show
    @blog_post = BlogPost.find(params[:id])
  end
end
