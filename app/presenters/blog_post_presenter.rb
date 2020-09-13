# frozen_string_literal: true

class BlogPostPresenter
	COLORS = %w(
		primary
		secondary
		success
		danger
		warning
		light
		info
		dark
		white
		purple
		cyan
		pink
		indigo
		teal
		orange
	)

	attr_reader :blog_post

	def initialize(blog_post)
		@blog_post = blog_post
	end

	def publish_on
		blog_post.publish_on&.strftime('%B %e, %Y')
	end

	def status_dropdown_options
		blog_post.class.statuses.keys
	end

  def publisher_dropdown_options
		User.where(email: %w[danelson@greatawait.com andrea@goforno.com])
  end

	def bg_color_dropdown_options
		COLORS
	end
end
