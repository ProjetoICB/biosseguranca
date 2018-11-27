class LogsController < ApplicationController

  before_action :set_log, only: [:show]

  before_filter 'autenticado?'


  # GET /logs
  # GET /logs.json
  def index
    @logs = Log.all.order('id desc')
  end

  # GET /logs/1
  # GET /logs/1.json
  def show
    @log = Log.find(params[:id])
  end


    # Never trust parameters from the scary internet, only allow the white list through.
    def log_params
      params.require(:log).permit(:acao, :ip)
    end
end
