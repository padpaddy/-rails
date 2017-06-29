class UsersController < ApplicationController

	def sign_up
		@user = User.new
	end

	def create
		@user = User.new(user_params)

		if @user.save
			#ExampleMailer.sample_email(@user).deliver
			redirect_to root_path
		else
			render :sign_up
		end
	end

	def sign_in
	end

	private
	def user_params
		params.require(:user).permit(:first_name, :last_name, :email, :password)
	end
end
