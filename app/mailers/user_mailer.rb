class UserMailer < ApplicationMailer

   def welcome_email(user)
    binding.pry
    @user = user
    @url  = 'http://example.com/login'
    mail(to: @user.email, subject: 'Welcome to My Awesome Site')
  end
end
