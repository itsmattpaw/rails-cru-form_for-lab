class GenresController < ApplicationController

    def show
        @genre = Genre.find(params[:id])
    end

    def new
        @genre = Genre.new
        render 'form'
    end

    def create
        @genre = Genre.create(permit_params(:name))
        redirect_to genre_path(@genre)
    end

    def edit
        @genre = Genre.find(params[:id])
        render 'form'
    end

    def update
        @genre = Genre.find(params[:id])
        @genre.update(permit_params(:name))
        redirect_to genre_path(@genre)
    end

    private
    def permit_params(*args)
        params.require(:genre).permit(*args)
    end
end
