Rails.application.routes.draw do
  defaults format: :json do
    resources :tests

    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
    get "/rating", to: "ratings#show"
    put "/rating", to: "ratings#upsert"
    delete "/rating", to: "ratings#destroy"
  end
end
