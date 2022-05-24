class Public::GenresController < ApplicationController
  before_action :authenticate_customer!, only: [:edit, :update]
  def create
    @genre = Genre.new(genre_params)
    if @genre.save
     redirect_to genres_path, notice: "You have created Genre successfully."
    else
      @genres = Gnenre.all
      render :index
    end
  end

  def index
    @genres = Genre.all
    @genre = Genre.new
  end

  def edit
    @genre = Genre.find(params[:id])
  end

  def update
   @genre = Genre.find(params[:id])
   if @genre.update(genre_params)
    redirect_to genres_path, notice: "You have updated Genre successfully."
   else
     render :edit
   end
  end

  private

  def genre_params
    params.require(:genre).permit(:book_id, :name)
  end
end
