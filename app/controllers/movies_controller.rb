class MoviesController < ApplicationController
  
  before_action :restrict_access

  def index
    @movies = Movie.all
    if params[:query_title].present?
      @movies = @movies.where("title LIKE ?", "%#{params[:query_title]}%") 
    end
    if params[:query_director].present?
      @movies = @movies.where("director LIKE ?", "%#{params[:query_director]}%")
    end
    if (params[:duration]) == 'short'
      @movies = @movies.where("runtime_in_minutes < 90")
    elsif params[:duration] == 'medium'
      @movies = @movies.where("runtime_in_minutes >=90 AND runtime_in_minutes < 120")
    elsif params[:duration] == 'long'
      @movies = @movies.where("runtime_in_minutes >= 120")
    end  

  end

  # def index
  #   if params[:query_title]
  #     @movies = Movie.where("title LIKE ? OR director LIKE ?", "%#{params[:query]}%", "%#{params[:query]}%")
    
  #   else
  #     @movies = Movie.all
  #   end
  # end

  def show
    @movie = Movie.find(params[:id])
  end

  def new
    @movie = Movie.new
  end

  def edit
    @movie = Movie.find(params[:id])
  end

  def create
    @movie = Movie.new(movie_params)

    if @movie.save
      redirect_to movies_path, notice: "#{@movie.title} was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @movie = Movie.find(params[:id])

    if @movie.update_attributes(movie_params)
      redirect_to movie_path(@movie)
    else
      render :edit
    end
  end

  def destroy
    @movie = Movie.find(params[:id])
    @movie.destroy
    redirect_to movies_path
  end

  protected

  def movie_params
    params.require(:movie).permit(
      :title, :release_date, :director, :runtime_in_minutes, :image, :description
    )
  end

end
