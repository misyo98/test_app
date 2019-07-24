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
      flash[:success] = "Welcome!"
      redirect_to cars_path
    else
      render 'new'
    end
  end

  def update
    @car = resource
    if @car.update(car_params)
      # redirect_to account_user_path(user: @user)
    else
      render :edit
    end
  end

   def destroy
    @car = resource
    @car.destroy

    # redirect_to account_users_path
  end

  private

  def resource
  	Car.find(params[:id])
  end

	def car_params
    params.require(:car).permit(:model, :color, :destination)
  end
end