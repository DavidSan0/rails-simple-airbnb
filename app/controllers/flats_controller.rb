class FlatsController < ApplicationController
    #READ all -----------------------------
    def index
        @flats = Flat.all
    end

    #READ one -----------------------------
    def show
        @flat = Flat.find(params[:id])
    end

    #CREATE -----------------------------
    def new
        @flat = Flat.new
    end

    def create
        @flat =Flat.new(flat_params)
        @flat.save

        redirect_to flat_path(@flat)
    end

    #UPDATE -----------------------------
    def edit
        @flat = Flat.find(params[:id])
    end

    def update
        @flat = Flat.find(params[:id])
        @flat.update(flat_params)
    end

    #DELETE -----------------------------
    def destroy
        @flat = Flat.find(params[:id])
        @flat.destroy
    
        redirect_to flats_path
    end

    private #------------------------------------------------------

    def flat_params
        params.require(:flat).permit(:name, :address, :description, :price_per_night, :number_of_guests)
    end
end
