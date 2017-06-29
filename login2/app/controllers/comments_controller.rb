class CommentsController < ApplicationController

	def index
		@comments = Post.find(params[:post_id]).comments.all
		@comment = Comment.new
		@post = Post.find(params[:post_id])
		@user = @post.user
		@current_user = current_user()
	end

	def new
		@comment = Comment.new
	end

	def show
		@comment = Post.find(params[:post_id]).comments.find(params[:id])
	end

	def create
	    @post = Post.find(params[:post_id])
	    @comment = @post.comments.new(comment_params)
	    if (@comment.save)
	    	redirect_to post_comments_path(@post)
	    else
	    	render 'index'
	    end
  	end

  	def current_user
  		User.find(session[:user_id])
  	end

  	private 
  	def comment_params
  		params.require(:comment).permit(:content)
  	end

end
