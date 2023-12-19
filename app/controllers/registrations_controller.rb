class RegistrationsController < ApplicationController
  skip_before_action :authenticate
  before_action :set_user_and_password_confirmation, only: %i[create password_validation]

  def new
    @user = User.new
  end

  def create
    if @user.save
      session_record = @user.sessions.create!
      cookies.signed.permanent[:session_token] = { value: session_record.id, httponly: true }

      redirect_to root_path, notice: "Welcome! You have signed up successfully"
    else
      render :new, status: :unprocessable_entity
    end
  end

  def password_validation
    @user.valid?
    respond_to do |format|
      format.turbo_stream
    end
  end

  private
    def user_params
      params.permit(:email, :password, :password_confirmation)
    end

    def set_user_and_password_confirmation
      @user = User.new(user_params)
      @user.password_confirmation = user_params[:password]
    end
end
