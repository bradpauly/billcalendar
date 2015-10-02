class RegistrationsController < ApplicationController
  def new
    @registration_form = RegistrationForm.new
  end

  def create
    @registration_form = RegistrationForm.new(params[:registration_form])
    if @registration_form.save
      start_session(@registration_form.user)
      redirect_to '/'
    else
      render :new
    end
  end
end
