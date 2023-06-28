Rails.application.routes.draw do
    # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html
  
    # Defines the root path route ("/")
    root "myapp#index"
    get 'hello', to: 'myapp#hello'
    get 'foo', to: 'myapp#foo'
  end