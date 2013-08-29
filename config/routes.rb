DevStudyMission08::Application.routes.draw do
  devise_for :users
  
  resources :posts do
    collection do
      get 'tags'
    end
  end

  # 같은 users를 사용시에 resources가 devise_for보다 위에 있으면 제대로 동작이 안되는 경우가 있음.
  # 참고 : http://stackoverflow.com/questions/5051487/combining-devise-with-resources-users-in-rails
  resources :users, :only => [:index, :show]

  root to: 'posts#index'
end
