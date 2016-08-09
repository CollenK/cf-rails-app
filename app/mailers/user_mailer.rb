class UserMailer < ApplicationMailer
  default from: "collen.kriel@gmail.com"

  def contact_form(email, name, message)
  @message = message
    mail(:from => email,
        :to => 'collen.kriel@gmail.com',
        :subject => "A new contact form message from #{name}")
  end

  def thank_you
    @name = params[:name]
    @email = params[:email]
    @message = params[:message]
    UserMailer.contact_form(@email, @name, @message).deliver_now
  end

  def welcome(user)
    @appname = "Fuji Fanatics"
    mail( :to => user.email, :subject => "Welcome to #{@appname}!")
  end
end
