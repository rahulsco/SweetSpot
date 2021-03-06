class Api::RestaurantsController < ApplicationController

  def index
    if params[:name]
      @restaurants = Restaurant.joins(:address)
                               .includes(:address, :reviews, :pictures, :category)
                               .where("Restaurants.name ILIKE ?", "%#{params[:name]}%")
    else
      @restaurants = Restaurant.includes(:address, :reviews, :pictures, :category)
    end

    render :json => @restaurants.to_json(:include => [:address, :reviews, :pictures, :category])
  end

  def create
    @restaurant = Restaurant.new(params[:restaurant])

    if @restaurant.save
      render :json => @restaurant.to_json(:include => [:address, :reviews, :pictures, :category])
    else
      render :json => @restaurant.errors.full_messages, :status => 422
    end
  end

  def show
    @restaurant = Restaurant.includes(:address, :reviews, :pictures, :category)
                            .find(params[:id])
    render :json => @restaurant.to_json(:include => [:address, :reviews, :pictures, :category])
  end
  #
  # def update
  #   @restaurant = Restaurant.find(params[:id])
  #   if @restaurant.update_attributes(params[:restaurant])
  #     render :json => @restaurant
  #   else
  #     render :json => @restaurant.errors.full_messages, :status => 422
  #   end
  # end

end