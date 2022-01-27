class MoviesController < ApplicationController
  def index
    @movies = Movie.all
  end

  def create
    @movie = Movie.new(movie_params)
    #@movie.list = @movie

    flash[:notice] = @movie.errors.full_messages.to_sentence unless @movie.save
    redirect_to movies_path(@movie)
  end

  def new
    @movie = Movie.new
  end

  def edit
  end

  def show
    @movie = Movie.find(params[:id])
  end

  private

  def movie_params
    params.require(:movie).permit(:title, :overview, :rating)
  end
end
