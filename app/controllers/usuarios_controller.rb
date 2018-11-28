# encoding: utf-8
class UsuariosController < ApplicationController

 before_filter :usuario_autenticado?

  def index
    @usuarios = Usuario.all
  end

  def edit
    @usuario = Usuario.find(params[:id])
  end


  def show
    @usuario = Usuario.find(params[:id])
  end

  def update
    @usuario = Usuario.find(params[:id])
    addlog("Atualizando usuario")
    respond_to do |format|
      if @usuario.update(usuario_params)
        format.html { redirect_to usuarios_url, notice: 'Usuario alterado com sucesso.' }
      else
        format.html { render :edit }
        format.json { render json: @usuario.errors, status: :unprocessable_entity }
      end
    end
  end

  private
  # Use callbacks to share common setup or constraints between actions.
  def set_usuario
    @usuario = Usuario.find(params[:id])
  end

  # Never trust parameters from the scary internet, only allow the white list through.
  def usuario_params
    params.require(:usuario).permit()
  end

end