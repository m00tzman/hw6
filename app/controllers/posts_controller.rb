class PostsController < ApplicationController
	def index
		@posts = Post.all
	end
	def show
		@post = Post.find_by_id(params[:id])
	end
	def new
		@post = Post.new
	end
	def create
		@post = Post.new(params[:post])

		if @post.save
			redirect_to post_path(@post), notice: "You added a new post!"
		else
			flash[:alert] = "There was an error creating the post"
			render :new
		end
	end

	def destroy
		@post = Post.find_by_id(params[:id])

		if @post.destroy
			flash[:notice] = "You destroyed a post!"
		else
			flash[:alert] = "There was an error while attempting to delete the post"
		end
		redirect_to posts_path
	end
end

