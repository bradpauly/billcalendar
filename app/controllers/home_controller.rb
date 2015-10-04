class HomeController < ApplicationController
  def index
    @registration_form = RegistrationForm.new
    @login_form = LoginForm.new
  end
end
