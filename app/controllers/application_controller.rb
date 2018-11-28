class ApplicationController < ActionController::Base
  protect_from_forgery



  include WelcomeHelper
  include LogsHelper

  def usuario_autenticado?
    if session[:login].blank?
      redirect_to welcome_login_path
       return false
    end
  end
end