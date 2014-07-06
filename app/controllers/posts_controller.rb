class PostsController < ApplicationController

	def index
		if params[:search]
			@post = Post.where('title LIKE ?', "%#{params[:search]}%")
			if @post.count == 0
				flash[:notice] = "沒有相似結果，請重新搜尋"
			end
		else
			@post = Post.all
		end
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

	def edit
		@post = Post.find(params[:id])
	end

	def update
		@post = Post.find(params[:id])
		if @post.update(post_params)
			redirect_to posts_path, :notice => "編輯成功"
		else
			render :edit
		end
	end

	def destroy
		@post = Post.find(params[:id])
		@post.destroy
		redirect_to posts_path, :notice => "文章已刪除"
	end

	private
	def post_params
		params.require(:post).permit(:title, :content, :image)
	end
end
