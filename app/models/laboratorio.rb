class Laboratorio < ActiveRecord::Base
  attr_accessible :organismos, :nivel, :pesquisador, :tel_pesquisador, :usuario_id
  belongs_to :usuario

  validates_presence_of :organismos
  validates_presence_of :nivel
  validates_presence_of :pesquisador
  validates_presence_of :tel_pesquisador, :message => "Coloque o telefone do pesquisador responsavel"
end