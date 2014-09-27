class PostsController < ApplicationController

	def index
		@posts = Post.all
	end

	def new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to posts_path
		else
			@messages = @post.errors.messages
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update_attributes(post_params)
			redirect_to posts_path
		else
			@messages = @post.errors.messages
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy 
		redirect_to posts_path
	end

	private

	def post_params
		params.require(:post).permit(:title, :body)
	end
end
