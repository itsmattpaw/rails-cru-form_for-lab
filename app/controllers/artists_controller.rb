class ArtistsController < ApplicationController

    def show
        @artist = Artist.find(params[:id])
    end

    def new
        @artist = Artist.new
        render 'form'
    end

    def create
        @artist = Artist.create(permit_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    def edit
        @artist = Artist.find(params[:id])
        render 'form'
    end

    def update
        @artist = Artist.find(params[:id])
        @artist.update(permit_params(:name, :bio))
        redirect_to artist_path(@artist)
    end

    private
    def permit_params(*args)
        params.require(:artist).permit(*args)
    end
    
end
