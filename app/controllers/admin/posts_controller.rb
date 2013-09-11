class Admin::PostsController < ApplicationController

	before_filter :find_post, only: [:edit, :update, :destroy]
	def new
		@post = Post.new
	end

	def create
		@post = Post.new post_params
		if @post.save
			redirect_to post_path(@post)
		else
			render :new
		end
	end

	def edit
	end

	def update
		if @post.update_attributes post_params
			redirect_to post_path(@post)
		else
			render :edit
		end
	end

	def destroy
		@post.destroy
		redirect_to posts_path
	end



  private
	  def post_params
	    params.require(:post).permit(:title, :text, :image)
	  end

	 	def find_post
	 		@post = Post.find_by_id params[:id]
	 	end
end