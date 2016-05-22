class BookingsController < ApplicationController

  def new
    @page = Page.find_by(machine_name: 'book_table')
    @booking = Booking.new
  end

  def create
    @booking = Booking.new(booking_params)

    if @booking.save
      redirect_to book_online_thanks_path
    else
      render :new
    end
  end

  def thanks
    @page = Page.find_by(machine_name: 'book_table')
  end

  private


  # Only allow a trusted parameter "white list" through.
    def booking_params
      params.require(:booking).permit(:name, :telephone, :email, :number_of_people, :date, :time, :message)
    end
end