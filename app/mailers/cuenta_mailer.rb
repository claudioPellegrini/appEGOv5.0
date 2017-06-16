class CuentaMailer < ApplicationMailer
	default from: 'eattinggo@gmail.com'
	def mailing(mail, menu)
		@correo = mail
		@menu = menu
		attachments['Menudeldia.pdf'] = File.read('public/Menudeldia.pdf', mode: "rb")
  		mail(:to => @correo, :subject => 'Menu del dia')  		
		
  	end
  	layout 'mailer'
end
