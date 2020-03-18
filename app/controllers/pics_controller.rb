class PicsController < ApplicationController
	before_action :authenticate_user!
	before_action :find_pic, only: [:show, :edit, :update, :destroy, :toggle_like]

	def index	
		@pics = Pic.order(created_at: :desc)
	end

	def new
		@pic = current_user.pics.build
	end

	def create
		@pic = current_user.pics.build(pic_params)
		byebug

		if @pic.save
			redirect_to @pic, notice: 'Post successfully created!'
		else
			render :new
		end
	end

	def show
	end
	
	def edit
		redirect_to @pic unless @pic.user == current_user
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: 'Post successfully updated!'
		else
			render :edit
		end
	end

	def toggle_like
		if @pic.likes.empty?
			@pic.likes.create(user: current_user, flag: true)
		else
			toggle = !current_user.liked_pic(@pic).flag?
			current_user.liked_pic(@pic).update_attributes(flag: toggle)
		end
		redirect_back fallback_location: root_path
	end

	def destroy
		@pic.destroy
		redirect_to pics_path, notice: 'Post successfully deleted!'
	end

	private

		def find_pic
			@pic = Pic.find(params[:id])
		end

		def pic_params
			params.require(:pic).permit(:title, :image)
		end

end
