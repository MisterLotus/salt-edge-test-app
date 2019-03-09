Rails.application.routes.draw do

  get 'call_back/handle'
  get 'main/show_main'
  get 'main/create_user'
  get 'main/create_token'
  get 'main/create_login'
  get 'main/refresh_login'
  get 'main/reconnect_login'
  get 'main/destroy_login'
  get 'main/show_login'
  get 'main/show_accounts'
  get 'main/show_posted_transactions'
  get 'main/show_pending_transactions'
  get 'main/show_logs'
  devise_for :users
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
