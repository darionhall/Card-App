class SessionsController < ApplicationController

  def new
  end

# start session once user is logged in, redirecting user to card index page or flash error is authN is not verified
  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      sign_in user
      redirect_back_or cards_path
    else
      flash.now[:error] = 'Invalid email/password combination'
      render 'new'
    end
  end

# end session, redirect user to home page
  def destroy
    sign_out
    redirect_to root_url
  end
end
