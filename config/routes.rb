Rails.application.routes.draw do
  resources :login, only: [:create]
  
  resources :users do
    get 'diaries', :on => :member # GET /users/<uid>/diaries
  end

  resources :diaries do
    get 'comments', :no => :member # GET /diaries/1/comments
    get 'diary_reactions', :no => :member # GET /diaries/1/diary_reactions
  end

  resources :comments do
    get 'comment_reactions', :no => :member # GET /comments/1/comment_reactions
  end

  resources :comment_reactions
  resources :diary_reactions
  
  # For details on the DSL available within this file, see https://guides.rubyonrails.org/routing.html
end
