class ApplicationController < ActionController::Base
  protect_from_forgery



  include WelcomeHelper
  include LogsHelper

=begin
  def usuario_autenticado?
    if session[:usuario_id].blank?
      redirect_to login_path, notice: "Efetue o login antes de entrar"
      # return false
    end
  end

=end







end