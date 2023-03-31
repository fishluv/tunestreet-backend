class LoginMailer < ApplicationMailer
  def login_email
    @user = params[:user] or raise ArgumentError, "missing `user`"
    @login_url = params[:login_url] or raise ArgumentError, "missing `login_url`"

    to =
      if @user.username.present?
        email_address_with_name(@user.email, @user.username)
      else
        @user.email
      end

    mail to: to, subject: "TuneStreet login link"
  end
end
