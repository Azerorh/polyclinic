class CasesController < ApplicationController

  def index
    if params[:doctor_id]
      @cases = Case.where(doctor_id: params[:doctor_id])
    elsif params[:user_id]
      @cases = Case.where(user_id: params[:user_id])
    end
  end

  def edit
    set_doctor
    set_case
  end

  def new
    set_user
    @case = @user.cases.build
    @doctors = Doctor.all.collect {|doctor| [doctor.fullname, doctor.id]}
  end

  def create
    set_user
    @case = @user.cases.build(required_params)

    if @case.save
      flash[:notice] = "Successfully created."
      redirect_to user_cases_path(@user)
    else
      flash[:notice] = @case.errors.full_messages.to_sentence
      redirect_to new_user_case_path
    end
  end

  def update
    set_doctor
    set_case
    if @case.update(required_params)
      flash[:notice] = "Successfully updated."
      redirect_to doctor_cases_path(@doctor)
    else
      flash[:notice] = @case.errors.full_messages.to_sentence
      render :edit
    end
  end

  private

  def set_doctor
    @doctor = Doctor.find(params[:doctor_id])
  end

  def set_case
    @case = Case.find(params[:id])
  end

  def set_user
    @user = User.find(params[:user_id])
  end

  def required_params
    params.require(:case).permit(:question, :status, :doctor_id)
  end
end
