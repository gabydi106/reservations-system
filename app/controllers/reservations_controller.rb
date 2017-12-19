class ReservationsController < ApplicationController
  before_action :set_reservation, only: [:show, :edit, :update, :destroy, :assign_beds, :unassign_beds]

  def index
    @reservations = Reservation.all
  end

  def show
  end

  def new
    @reservation = Reservation.new
  end

  def edit
  end

  def create
    @reservation = Reservation.new(reservation_params)

    respond_to do |format|
      if @reservation.save
        format.html { redirect_to @reservation, notice: 'Reservation was successfully created.' }
        format.json { render :show, status: :created, location: @reservation }
      else
        format.html { render :new }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def update
    respond_to do |format|
      if @reservation.update(reservation_params)
        format.html { redirect_to @reservation, notice: 'Reservation was successfully updated.' }
        format.json { render :show, status: :ok, location: @reservation }
      else
        format.html { render :edit }
        format.json { render json: @reservation.errors, status: :unprocessable_entity }
      end
    end
  end

  def assign_beds
    @beds = Bed.where("available is true")
               .first(@reservation.number_of_beds)
               .each do |bed|
      unless (Bed.where(:reservation_id => @reservation.id).count == @reservation.number_of_beds)
        bed.update_attributes(available: false, reservation_id: @reservation.id)
      end
    end
    redirect_to reservations_url
  end

  def unassign_beds
    @beds = Bed.where(:reservation_id => @reservation.id).each do |bed|
      bed.update_attributes(available: true, reservation_id: nil)
    end
    redirect_to reservations_url
  end

  def destroy
    @reservation.destroy
    respond_to do |format|
      format.html { redirect_to reservations_url, notice: 'Reservation was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    def set_reservation
      @reservation = Reservation.find(params[:id])
    end

    def reservation_params
      params.require(:reservation).permit(:checkin, :checkout, :guest_id, :number_of_beds)
    end
end
