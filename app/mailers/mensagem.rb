class Mensagem < ActionMailer::Base
  default from: "naoresponder@icb.usp.br"

  def senha_reset(usuario)
    @usuario = usuario
    mail(:to => usuario.email, :subject => "Troca de senha")
  end
end
