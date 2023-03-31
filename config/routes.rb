Rails.application.routes.draw do
  defaults format: :json do
    post "login/requests", to: "logins#request_login"
    # Has to be GET because this is the login url we email to users.
    get "login/sessions", to: "logins#create_session"
    delete "login/sessions", to: "logins#delete_session"

    get "users/me", to: "users#show"
    patch "users/me", to: "users#update"

    get "ratings", to: "ratings#show"
    put "ratings", to: "ratings#upsert"
    delete "ratings", to: "ratings#destroy"

    resources :tests
  end
end
