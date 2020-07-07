class Api::PlacesController < ApplicationController

  def index
    @places = Place.all
    render "index.json.jb"
  end

  def create
    @place = Place.new(
      name: params[:name],
      address: params[:address]
    )
    if @place.save
      render "show.json.jb"
    else 
      render json: {errors: @place.errors.full_messages}, status: :bad_request
    end
  end

  def show
    @place = Place.find(params[:id])
    render "show.json.jb"
  end

  def update
    @place = Place.find_by(id: params[:id])
    @place.name = params[:name] || @place.name
    @place.address = params[:address] || @place.address
    if @place.save
      render "show.json.jb"
    else  
      render json: {errors: @place.errors.full_messages}, status: :bad_request
    end
  end

  def destroy
    place = Place.find_by(id: params[:id])
    place.destroy
    render json: {message: "Place successfully destroyed!"}
  end

end
