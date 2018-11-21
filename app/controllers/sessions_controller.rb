class SessionsController < ApplicationController

  def create
    if request.post?
      @usuario=Usuario.find_by_email_and_senha(params[:email], Digest::SHA2.hexdigest("B10s$3G#{params[:senha]}G3$s01B"))
      if @usuario
        session[:usuario_id] = @usuario.id
        redirect_to laboratorios_path
        flash[:notice] = "Logado"
      else
        flash[:notice] = "Login ou senha incorretos"
        redirect_to login_path
        session[:usuario_id] = nil
      end
    end
  end


  def destroy
    session.destroy
     redirect_to root_path
  end

end
