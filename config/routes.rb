Rails.application.routes.draw do
  scope '/api' do
    resources :books
    get 'books/users/:id', to: 'books#user_books'

    post '/login', to: 'sessions#create'
    delete '/logout', to: 'sessions#destroy'
    get '/logged_in', to: 'sessions#is_logged_in?'

    resources :users, only: [:create, :show, :index]
    get 'users/:id', to: 'users#find_user'
  end
end
