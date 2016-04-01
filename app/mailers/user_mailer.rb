class UserMailer < ApplicationMailer
 default from: 'notifications@example.com'
 
  def welcome_email(user)
    @user = user
    email_with_name = %("#{@user.firstname}" <#{@user.email}> )
    @url  = 'http://example.com/login'
    mail(to: email_with_name, subject: 'Welcome to My Awesome Site') 
    # do |format|
    #   format.html { render 'another_template' }
    #   format.text { render text: 'Render text' }
  end

  def destroy_email(user)
    @user = user
    email_with_name = %("#{@user.firstname}" <#{@user.email}> )
    @url  = 'http://example.com/login'
    mail(to: email_with_name, subject: 'You have been deleted from my Awesome Site') 
    # do |format|
    #   format.html { render 'another_template' }
    #   format.text { render text: 'Render text' }
  end
end
