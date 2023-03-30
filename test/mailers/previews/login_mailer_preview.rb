class LoginMailerPreview < ActionMailer::Preview
  # http://localhost:3000/rails/mailers/login_mailer/login_email.html
  def login_email
    LoginMailer
      .with(
        user: User.new(email: "fishluv.popn@gmail.com"),
        url: "http://example.com",
      )
      .login_email
  end
end
