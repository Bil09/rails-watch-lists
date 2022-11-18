Rails.application.routes.draw do
  resources :lists, only: %i[index new create show] do
    resources :movies, only: %i[new create show]
  end
  post 'bookmarks/:list_id/:movie_id', to: 'bookmarks#create', as: 'new_bookmark'
  delete 'bookmarks/:id', to: 'bookmarks#destroy', as: 'delete_bookmark'
end
