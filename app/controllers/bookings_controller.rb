class BookingsController < ApplicationController

  def take_guest
    Restaurant
  end
  def show
    @booking = Booking.find(params[:id])
  end

  def new
    @booking = Booking.new
  end

  def create

    #below 'unless' is redundant or should be rewritten maybe, given the bookings model
    unless restaurant.guests =< 0
    @booking = Booking.new(booking_params)

    if @booking.save
        redirect_to booking_url
    Restaurant.update_attribute(:numericality => -1)

    else
      flash[:alert] = "Restaurant is full"
    end
    end
  end

  private
  def booking_params
    params.require(:restaurant, :guests, :date, :time)
  end

end
