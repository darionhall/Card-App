class ApplicationController < ActionController::Base
  # Prevent CSRF (cross-site request forgery)attacks by raising an exception.
  #this will raise an exception when the CSRF token doesn't match
  protect_from_forgery with: :exception

  include SessionsHelper
end
