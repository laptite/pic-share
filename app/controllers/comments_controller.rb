class CommentsController < ApplicationController
	before_action :find_pic, only: [:create, :destroy]

	def create
		@comment = @pic.comments.create(params[:comment].permit(:body))
		# FIX -- Make ajax update on index instead of redirect to show
		redirect_to pic_path(@pic)
	end

	def destroy
		@comment = @pic.comment.find(params[:id])
		@comment.destroy
		# FIX -- Make ajax update on index instead of redirect to show
		redirect_to pic_path(@pic)
	end

	private

		def find_pic
			@pic = Pic.find(params[:pic_id])
		end
end
