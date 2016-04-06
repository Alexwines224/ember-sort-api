class Api::SlicesController < ApplicationController
	protect_from_forgery with: :null_session
	respond_to :json

	def index
		slices = Slice.all
		respond_with slices
	end

	def show
		slice = Slice.find(params[:id])
		respond_with slice
	end

	def create
		slice = Slice.new(slice_params)
		if slice.save
			respond_with slice, location: [:api, slice]
		else
			respond_with slice
		end
	end

	def update
		slice = Slice.find(params[:id])
		if slice.update_attributes(slice_params)
			head 204
		else
			respond_with slice
		end
	end

	def destroy
		slice = Slice.find(params[:id])
		slice.destroy
		head 204
	end

	private

	def slice_params
		params.require(:slice).permit([:title, :design_id])
	end

end
