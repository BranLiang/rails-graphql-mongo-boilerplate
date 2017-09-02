Rails.application.routes.draw do
  if Rails.env.development?
    mount GraphiQL::Rails::Engine, at: '/graphiql', graphql_path: '/api/graphql'
  end

  namespace :api do
    # User Login
    post '/login', to: 'authentication#authenticate'
    # GraphQL api endpoint
    post '/graphql', to: 'graphql#execute'
    # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  end
end
