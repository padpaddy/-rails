class ExampleMailer < ApplicationMailer
  default from: "naoei@gmail.com"

  def sample_email(user)
    @user = user
    mail(to: @user.email, subject: 'Welcome Email')
  end

end
