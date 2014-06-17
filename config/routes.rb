TvShows::Application.routes.draw do
  resources :television_shows, only: [:index, :show, :new, :create]
  resources :characters, only: [:index, :show, :new, :create, :destroy]
end
