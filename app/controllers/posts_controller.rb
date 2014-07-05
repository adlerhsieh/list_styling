class PostsController < ApplicationController

	def index
		@post = Post.all
	end	

	def new
		@post = Post.new
	end

	def create
		@post = Post.new(post_params)

		if @post.save
			redirect_to posts_path
			flash[:notice] = "發佈成功"
		else
			render :new
		end
	end

	def show
		@post = Post.find(params[:id])
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to root_url
	end

	private
	def post_params
		params.require(:post).permit(:title, :content)
	end
end
