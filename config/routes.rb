Rails.application.routes.draw do
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
  scope 'lines' do
  	post '/last/:n', to: 'text_processor#last_lines'
  	post "/first/:n", to: 'text_processor#first_lines'
  	post '/last', to: 'text_processor#last_lines'
  	post "/first", to: 'text_processor#first_lines'
  end

  namespace 'documentation', path: '/' do
  	resources :documentation, only: %i[index]
  end
end
