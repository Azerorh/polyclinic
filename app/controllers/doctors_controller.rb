class DoctorsController < ApplicationController
  load_and_authorize_resource

  def index
    @categories = Category.all
    if params[:category_id]
      @doctors = Doctor.where(category_id: params[:category_id])
    else
      @doctors = Doctor.all
    end
  end

  def show
    set_doctor
  end

  def patients
    set_doctor
    @patients = @doctor.cases
  end

  def edit
    set_doctor
  end

  def update
    set_doctor
    if @doctor.update(required_params)
      flash[:notice] = "Successfully updated."
      redirect_to @doctor
    else
      flash[:error] = @doctor.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:id])
  end

  def required_params
    params.require(:doctor).permit(:email, :phone_number, :avatar, :name, :surname)
  end
end
