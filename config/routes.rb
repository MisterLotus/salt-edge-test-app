Rails.application.routes.draw do

  get 'call_back/process'
  get 'main/showMain'
  get 'main/createUser'
  get 'main/createToken'
  get 'main/createLogin'
  get 'main/refreshLogin'
  get 'main/reconnectLogin'
  get 'main/destroyLogin'
  get 'main/showLogin'
  get 'main/showAccounts'
  get 'main/showPostedTransactions'
  get 'main/showPendingTransactions'
  get 'main/showLogs'
  devise_for :users
  get 'users/create'
  get 'users/showAll'
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html


end
