class PermitidosController < ApplicationController



 # before_filter 'autenticado?'


  # GET /permitidos
  # GET /permitidos.json
  def index
    @permitidos = Permitido.all
  end

  # GET /permitidos/1
  # GET /permitidos/1.json
  def show
    @permitido = Permitido.find(params[:id])
  end

  # GET /permitidos/new
  def new
    @permitido = Permitido.new
  end

  # GET /permitidos/1/edit
  def edit
    @permitido = Permitido.find(params[:id])
  end

  # POST /permitidos
  # POST /permitidos.json
  def create
    @permitido = Permitido.new(params[:permitido])

    respond_to do |format|
      if @permitido.save
        addlog("Deu permissao a um usuario")
        format.html { redirect_to @permitido, notice: 'Permissao criada com sucesso.' }
        format.json { render :show, status: :created, location: @permitido }
      else
        format.html { render :new }
        format.json { render json: @permitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /permitidos/1
  # PATCH/PUT /permitidos/1.json
  def update
    @permitido = Permitido.find(params[:id])
    respond_to do |format|
      if @permitido.update(params[:permitido])
        addlog("Atualizou a permissao de um usuario")
        format.html { redirect_to @permitido, notice: 'Permissao atualizada com sucesso.' }
        format.json { render :show, status: :ok, location: @permitido }
      else
        format.html { render :edit }
        format.json { render json: @permitido.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /permitidos/1
  # DELETE /permitidos/1.json
  def destroy
    @permitido = Permitido.find(params[:id])
    @permitido.destroy
    addlog("Negou permissao de um usuario")
    respond_to do |format|
      format.html { redirect_to permitidos_url, notice: 'Permissao apagada com sucesso' }
      format.json { head :no_content }
    end
  end

end
