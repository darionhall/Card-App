class StaticPagesController < ApplicationController

  #this function redirects uses to the card index if signed in
  def home
    redirect_to cards_path if signed_in?
  end

  def about
  end
end
