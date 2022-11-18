class MoviesController < ApplicationController

  def show
    @movie = Movie.find(params[:id])
    @list = List.find(params[:list_id])
  end
  def new
    @movie = Movie.new
    @list = List.find params[:list_id]
  end

  def create
    @movie = Movie.find_by(title: params[:movie][:title])
    @list = List.find params[:list_id]
    @list.movies << @movie
    redirect_to list_path(@list)
  end

  private

  def movie_params
    params.require(:movie).permit(:title)
  end
end
