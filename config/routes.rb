Surveasy::Application.routes.draw do
  get "sessions/login"
  get "account/index"
  get "users/index"
  get "answer/index"
  get "answer_default/index"
  get "question/index"
  get "survey/index"

  namespace :api, defaults: { format: :json } do
    resources :actions
    resources :events
    resources :api_tokens
    resources :customers
    resources :analyses
    resources :users
    resources :surveys
    resources :questions
    resources :accounts
    resources :answers_default
    resources :answers
    resources :invite_user
  end

  root to: 'pages#index'
end
