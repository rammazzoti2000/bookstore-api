Rails.application.routes.draw do
  get 'homepage/index'
  scope '/api' do
    resources :books
    # get 'books/users/:id', to: 'books#user_books'
    #
    # post '/login', to: 'sessions#create'
    # delete '/logout', to: 'sessions#destroy'
    # get '/logged_in', to: 'sessions#is_logged_in?'

    resources :users, only: [:create, :show, :index]
    # get 'users/:id', to: 'users#find_user'
    #
    # namespace :users do
    #   resources :sessions, only: [:create]
    # end

  #   resources :books
  #   get '/books/user/:id', to: 'books#user_books'
  #   resources :users, only: [:create, :index]
  #   get 'users/:id', to: 'users#find_user'
  #   delete 'users/sessions', to: 'users/sessions#destroy'
  #   namespace :users do
  #     resources :sessions, only: [:create]
  #   end
  # root 'homepage#index'
  # get '/*path' => 'homepage#index'
  end
end
