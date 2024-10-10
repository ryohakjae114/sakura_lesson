Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admins do
    root 'lessons#index'
    resources :lessons, only: %i[new create] do
      resources :lesson_dates, only: %i[index new create], module: :lessons
    end
  end
  devise_for :users
  root 'lessons#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
