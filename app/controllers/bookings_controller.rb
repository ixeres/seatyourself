class BookingsController < ApplicationController
  def create
      @restaurant = Restaurant.find(params[:restaurant_id])
      @booking = @restaurant.bookings.build(booking_params)
      @booking.user = current_user

      if @booking.save
        redirect_to @booking.user, :notice => 'booking made'
        # @restaurant.minus_guests
      else
        render 'restaurants/show'
      end
    end

    def new
      @booking = Booking.new
    end

    def show
      @booking = Bookings.find(:id)
    end




    def booking_params
      params.require(:booking).permit(:time, :name, :guests)
    end
end
