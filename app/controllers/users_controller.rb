class UsersController < ApplicationController
	before_action :find_user, only: [:edit, :show, :update]
	before_action :user_params, only: [:update]

	def show
	end

	def edit
	end

	def update
		if @user.update(user_params)
			redirect_to edit_profile_path(@user)
		else
			render :edit
		end
	end

	def destroy
		@user.destroy
		redirect_to pics_path
	end

	private

		def find_user
			@user = User.find(params[:id])
		end

		def user_params
			params.require(:user).permit(:email, :handle, :bio, :avatar)
		end
end