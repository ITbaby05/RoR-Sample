class ApartmentsController < ApplicationController
	def index
		@apartments = Apartment.all
	end
	def new
		@apartment = Apartment.new
	end
	def create
		@apartment=Apartment.new(apartment_params)
		if(@apartment.save)
			redirect_to @apartment
		else
			render 'new'
		end
	end
	def show
		@apartment = Apartment.find(params[:id])
	end	
	def edit
		@apartment = Apartment.find(params[:id])
	end
	def update
		@apartment = Apartment.find(params[:id])

		if @apartment.update(apartment_params)
			redirect_to @apartment
		else
			render 'edit'
		end
	end
	def destroy
		@apartment = Apartment.find(params[:id])
		@apartment.destroy
		redirect_to apartments_path
	end
	private
	def apartment_params
		params.require(:apartment).permit(:room, :floor, :area, :price)
	end
end
