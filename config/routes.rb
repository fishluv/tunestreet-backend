Rails.application.routes.draw do
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  get "/s/:sid/:diff/rating", to: "chart_ratings#show"
end
