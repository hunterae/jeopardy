Jeopardy::Application.routes.draw do
  namespace :admin do
    resources :questions do
      member do
        get :set_as_daily_double
      end
    end
    resources :topics do
      member do
        get :move_up
        get :move_down
      end
    end
    resources :teams do
      member do
        get :move_up
        get :move_down
      end
    end
    namespace :command_center do
      resource :game, :controller => "game", :only => [:create, :destroy]
      resources :questions, :only => [:show] do
        resources :teams, :only => [] do
          resource :answer, :only => [:create, :destroy]
        end
      end
      resources :topics, :only => :show
      root :to => "command_center#index"
    end
  end
  resource :winner, :controller => "winner", :only => :show
  root :to => 'board#show'
end
