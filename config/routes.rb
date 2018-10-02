Rails.application.routes.draw do
  devise_for :owners, controllers: {registrations: 'owners/registrations'}
  # devise が生成してくれたownerモデルのコントローラのうち、registrations_controller はこちらでカスタムしたものを使いますよ、という宣言。（registrationsのすべてのメソッドを定義する必要はなく、カスタムしたいものだけを宣言すればよい）

  resources :owners, only: [:show]
  # showアクションはdeviseにないので、resoucesで用意する。

  resources :users
  resources :likes, only: [:create, :destroy]
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  
  root "users#index"
  get "/users" => "users#index"
  post "/users" => "users#index"
  get "/users/:id" => "users#show"
  post "/users/:id" => "users#show" 
end
