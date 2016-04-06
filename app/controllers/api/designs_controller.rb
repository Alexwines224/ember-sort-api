class Api::DesignsController < ApplicationController
	protect_from_forgery with: :null_session
	respond_to :json

	def index
		designs = Design.all
		respond_with designs
	end

	def show	
		design = Design.find(params[:id])
		respond_with design
	end

	def create
		design = Design.new(design_params)
		if design.save
			respond_with design, location: [:api, design]
		else
			respond_with design
		end
	end

	def update
		design = Design.find(params[:id])
		if design.update_attributes(design_params)
			head 204
		else
			respond_with design
		end
	end

	def destroy
		design = Design.find(params[:id])
		design.destroy
		head 204
	end

	private

	def design_params
		params.require(:design).permit([:title, :member])
	end

end
