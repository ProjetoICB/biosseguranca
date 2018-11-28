# encoding: utf-8
class LaboratoriosController < ApplicationController
  # GET /laboratorios
  # GET /laboratorios.json

  before_filter :usuario_autenticado?
  def index
    @laboratorios = Laboratorio.order('id desc')

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @laboratorios }
    end
  end

  # GET /laboratorios/1
  # GET /laboratorios/1.json
  def show
    @laboratorio = Laboratorio.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @laboratorio }
      format.pdf {send_data render_to_string,
                            filename: "lab_#{@laboratorio.id}.pdf",
                            type: 'application.pdf',
                            disposition: 'inline'

      }
    end
  end

  # GET /laboratorios/new
  # GET /laboratorios/new.json
  def new
    @laboratorio = Laboratorio.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @laboratorio }
    end
  end

  # GET /laboratorios/1/edit
  def edit
    @laboratorio = Laboratorio.find(params[:id])
  end

  # POST /laboratorios
  # POST /laboratorios.json
  def create
    @laboratorio = Laboratorio.new(params[:laboratorio])
    @laboratorio.usuario_id = session[:usuario_id]

    respond_to do |format|
      if @laboratorio.save
        format.html { redirect_to @laboratorio, notice: 'Laboratorio criado com successo.' }
        format.json { render json: @laboratorio, status: :created, location: @laboratorio }
      else
        format.html { render action: "new" }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /laboratorios/1
  # PUT /laboratorios/1.json
  def update
    @laboratorio = Laboratorio.find(params[:id])

    respond_to do |format|
      if @laboratorio.update_attributes(params[:laboratorio])
        format.html { redirect_to @laboratorio, notice: 'Laboratorio atualizado com sucesso.' }
        format.json { head :ok }
      else
        format.html { render action: "edit" }
        format.json { render json: @laboratorio.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /laboratorios/1
  # DELETE /laboratorios/1.json
  def destroy
    @laboratorio = Laboratorio.find(params[:id])
    @laboratorio.destroy

    respond_to do |format|
      format.html { redirect_to laboratorios_url }
      format.json { head :ok }
    end
  end
end
