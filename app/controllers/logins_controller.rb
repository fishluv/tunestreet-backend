class LoginsController < ApplicationController
  # Send login email for new or existing user.
  def request_login
    email = params.require(:user)[:email]

    user = User.find_or_create_by!(email: email)
    user.update!(
      login_token: SecureRandom.urlsafe_base64,
      login_token_valid_until: Time.now + 60.minutes,
    )

    # get "login/sessions", to: "logins#create_session"
    url = login_sessions_url(token: user.login_token)

    # TODO: Avoid logging email because it contains login url.
    LoginMailer.with(user: user, url: url).login_email.deliver_later

    render json: { message: "Login url sent to #{email}" }
  end

  # TODO: Make this a purely backend endpoint instead of redirecting to the frontend.
  def create_session
    token = params.require(:token)

    user =
      User
        .where(login_token: token)
        .find_by("login_token_valid_until > ?", Time.now)

    if user
      # Tokens should be single-use.
      user.update!(login_token: nil)

      # From Sorcery. Logs user in without credentials.
      auto_login(user)

      redirect_to Rails.configuration.tunestreet_frontend_url
    else
      redirect_to URI.join(Rails.configuration.tunestreet_frontend_url, "login_failed").to_s
    end
  end

  def delete_session
    # From Sorcery.
    logout

    render json: { message: "Logged out" }
  end
end
