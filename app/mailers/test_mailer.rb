class TestMailer < ApplicationMailer
  def test_email
    params[:subject] ||= "Test email"
    mail to: params[:email], subject: params[:subject]
  end
end
