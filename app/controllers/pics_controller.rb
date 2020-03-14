class PicsController < ApplicationController
	before_action :find_pic, only: [:show, :edit, :update, :destroy]

	def index	
		@pics = Pic.order(created_at: :desc)
	end

	def new
		@pic = Pic.new
	end

	def create
		@pic = Pic.new(pic_params)

		if @pic.save
			redirect_to @pic, notice: 'Post successfully created!'
		else
			render :new
		end
	end


	def show
	end
	
	def edit
	end

	def update
		if @pic.update(pic_params)
			redirect_to @pic, notice: 'Post successfully updated!'
		else
			render :edit
		end
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
			params.require(:pic).permit(:title, :description)
		end


end
