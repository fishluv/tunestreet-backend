class TestMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/test_mailer/test_email.html
  def test_email
    TestMailer.with(email: "fishluv.popn@gmail.com").test_email
  end
end
