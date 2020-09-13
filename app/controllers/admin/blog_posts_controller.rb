# frozen_string_literal: true

module Admin
  class BlogPostsController < ApplicationController
    before_action :set_blog_post, only: [:show, :edit, :update, :destroy]

    def index
      @blog_posts = BlogPost.latest
    end

    def show
    end

    def new
      @blog_post = BlogPost.new
    end

    def edit
    end

    def create
      @blog_post = BlogPost.new(blog_post_params)

      if @blog_post.save
        flash[:success] = 'Blog post was successfully created.'
        redirect_to admin_blog_post_path(@blog_post)
      else
        render :new
      end
    end

    def update
      if @blog_post.update(blog_post_params)
        flash[:success] = 'Blog post was successfully updated.'
        redirect_to admin_blog_post_path(@blog_post)
      else
        render :edit
      end
    end

    def destroy
      @blog_post.destroy

      flash[:success] = 'Blog post was successfully deleted.'
      redirect_to admin_blog_posts_url
    end

    private

    def set_blog_post
      @blog_post = BlogPost.find(params[:id])
    end

    def blog_post_params
      params.require(:blog_post).permit(:bg_color, :icon, :title, :status, :publish_on, :user_id)
    end
  end
end
