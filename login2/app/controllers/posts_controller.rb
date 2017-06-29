class PostsController < ApplicationController
	def index
		@posts = Post.all
		@post = Post.new
	end
	def show
		@post = Post.find(params[:id])
	end
	
	def create
		@post = current_user.posts.create(post_params)

		if @post.save
			#ExampleMailer.sample_email(@user).deliver
			redirect_to posts_path
		else
			flash[:notice]= "Post can't be blank"
			redirect_to posts_path
		end
	end

	def current_user
		User.find(session[:user_id])
	end

	def destroy 
		#puts "PARAM ID: " + params[:id]
		post = current_user.posts.find_by(id: params[:id])
		if post
			flash[:notice] = "You delete successfully"
			post.destroy
		else
			flash[:notice] = "You can't delete this post!"
		end
		redirect_to posts_path
	end

	def edit 
		post = current_user.posts.find_by(id: params[:id])
		if post.update(post_params)
			flash[:notice] = "You update successfully"
		else
			flash[:notice] = "You can't delete this post!"
		end
		redirect_to posts_path
	end

	private
	def post_params
		params.require(:post).permit(:content)
	end
end
