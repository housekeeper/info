Info::Application.routes.draw do
  # home page
  root :to => 'pages#show', :id => 'home'
end
