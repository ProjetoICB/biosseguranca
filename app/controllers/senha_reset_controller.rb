class SenhaResetController < ApplicationController

  def create
    usuario = Usuario.find_by_email(params[:email])
    if usuario.nil?
      redirect_to root_url
      flash[:notice] = "Usuario Inexistente"
    else
      usuario.send_senha_reset if usuario  # criar send_senha_reset no model depois
      redirect_to login_path
      flash[:notice] = "Verifique seu e-mail"
    end
  end

  def edit
    @usuario = Usuario.find_by_senha_reset_token!(params[:id])
    if @usuario.senha_reset_sent_at < 2.hours.ago
      redirect_to new_senha_reset_path, notice: "Tempo de troca de senha esgotado"
    end
  end

  def update
    @usuario = Usuario.find_by_senha_reset_token!(params[:id])
    if @usuario.senha_reset_sent_at < 2.hours.ago
      redirect_to new_senha_reset_path, notice: "Tempo de troca de senha expirado"
    else
      usuario=Usuario.find_by_senha_reset_token!(params[:id])
      usuario.criptografa_senha(params[:usuario][:senha])
      redirect_to login_path, notice: "Senha foi trocada"
    end
  end
end
