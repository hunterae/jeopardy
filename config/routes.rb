Jeopardy::Application.routes.draw do
  namespace :admin do
    namespace :command_center do
      resource :game, :controller => "game", :only => [:create, :destroy]
      resources :questions, :only => [:show] do
        resources :answers, :only => [:create]
      end
      resources :topics, :only => :show
      root :to => "command_center#index"
    end
    # resource :dashboard, :controller => "dashboard", :only => :show do
      # get :show_topic
    # end
  end
  root :to => 'board#show'
end
