class PnjmailerMailer < ApplicationMailer
  default from: 'professor@computeruniversity.in'

   def welcome_email(user,score)
      @user = user
      @score = score
      mail(to: @user.email, subject: 'Your recent test score is ready!')
   end
end
