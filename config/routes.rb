Rails.application.routes.draw do
  post 'authenticate', to: 'authentication#authenticate'
  post 'signup', to: 'authentication#signup'
  get 'question', to: 'questionnaire#get'
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
