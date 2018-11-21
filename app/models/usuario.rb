class Usuario < ActiveRecord::Base

  require 'digest'

  attr_accessible :nome, :email, :senha, :senha_confirmation, :auth_token, :senha_reset_token, :senha_reset_sent_at
  attr_accessor :senha_confirmation

  # relacionamentos

  has_many :laboratorios, :dependent => :destroy


  # validacoes
  validates_presence_of :nome, :message => "Digite seu nome"
  validates_presence_of :email, :message => "Digite seu e-mail"
  validates_presence_of :senha, :message => "Coloque a senha"
  validates_format_of :email , :on => :create, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message=> "Forma de email invalida"
  validates_format_of :email , :on => :update, :with => /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\Z/i, :message=> "Forma de email invalida"
  validates_uniqueness_of :email, :message =>  "Usuario ja cadastrado"


  ################################### Esquecimento de senha ############################################################################

  def send_senha_reset
    generate_token(:senha_reset_token)
    self.senha_reset_sent_at = Time.zone.now
    save!
    Mensagem.senha_reset(self).deliver
  end

  def generate_token(column)
    begin
      self[column] = SecureRandom.urlsafe_base64
    end while Usuario.exists?(column => self[column])
  end

  def criptografa_senha(senhanova)
    self.senha=Digest::SHA2.hexdigest("B10s$3G#{senhanova}G3$s01B")
    save!
  end
end

