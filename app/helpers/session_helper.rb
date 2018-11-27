module SessionHelper



  #cria uma sessão
  def log_in(loginUsuario)
    session[:login] = loginUsuario
  end

  #destroi a sessão criada na def anterior
  def log_out
    session.destroy
    @current_user = nil
  end

  def current_user
    @current_user ||= Usuario.find_by(loginUsuario: session[:login])
  end

  def logged_in?
    !current_usuario.nil?
  end

end
