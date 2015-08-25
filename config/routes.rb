Rails.application.routes.draw do
  resources :departamentos

  root "produtos#index"
  resources :produtos, only: [:new, :create, :destroy]
  get "/produtos/busca" => "produtos#busca", as: :busca_produto
=begin
           Prefix Verb   URI Pattern                       Controller#Action
    departamentos GET    /departamentos(.:format)          departamentos#index
                  POST   /departamentos(.:format)          departamentos#create
 new_departamento GET    /departamentos/new(.:format)      departamentos#new
edit_departamento GET    /departamentos/:id/edit(.:format) departamentos#edit
     departamento GET    /departamentos/:id(.:format)      departamentos#show
                  PATCH  /departamentos/:id(.:format)      departamentos#update
                  PUT    /departamentos/:id(.:format)      departamentos#update
                  DELETE /departamentos/:id(.:format)      departamentos#destroy
             root GET    /                                 produtos#index
         produtos POST   /produtos(.:format)               produtos#create
      new_produto GET    /produtos/new(.:format)           produtos#new
          produto DELETE /produtos/:id(.:format)           produtos#destroy
    busca_produto GET    /produtos/busca(.:format)         produtos#busca
=end
end
