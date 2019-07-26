class CarsController < ApplicationController
	def index
		@cars = Car.all
	end

	def new
		@car = Car.new
	end

	def show
		@car = resource
	end

	def edit
		@car = resource
	end

	def create
    @car = Car.new(car_params)
    if @car.save
      flash[:success] = "Have a nice journey!"
      redirect_to car_path(@car)
    else
      flash.now[:error] = "Something went wrong!"
      render :new
    end
  end

  def update
    @car = resource
    if @car.update(car_params)
      flash[:success] = "The problem is fixed!"
      redirect_to cars_path
    else
      flash.now[:error] = "Something went wrong!"
      render :edit
    end
  end

  def destroy
    @car = resource
    @car.destroy

    redirect_to cars_path, notice: 'Successfully deleted.'
  end

  private

  def resource
  	Car.find(params[:id])
  end

	def car_params
    params.require(:car).permit(:model, :color, :destination)
  end
end