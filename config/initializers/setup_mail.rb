ActionMailer::Base.smtp_settings = {
  	# :address              => "vps-211341.montevideo.net.uy",
   #  :port                 => 465,
   #  :domain               => "bioerix.com.uy",
   #  :user_name            => "comedor@bioerix.com.uy",
   #  :password             => "Migra.2k17",
   #  :authentication       => "plain",
   #  :enable_starttls_auto => true }
    :address => "smtp.mail.yahoo.com",

    # :address              => "smtp.gmail.com",
    :port                 => 587,

    # :domain               => "gmail.com",
    :domain               => "yahoo.com",
    # :user_name            => "eattinggo@gmail.com",
    :user_name            => "eatinggo@yahoo.com",
    # :password             => "appEGO2017",
    :password             => "ortPWD2017",
    :authentication       => "plain",
    :enable_starttls_auto => true }

ActionMailer::Base.default_url_options[:host] = "localhost:3000"
# Mail.register_interceptor(DevelopmentMailInterceptor) if Rails.env.development?