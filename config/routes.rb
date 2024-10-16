Rails.application.routes.draw do
  devise_for :admins, controllers: {
    sessions: 'admins/sessions',
  }
  namespace :admins do
    root 'lessons#index'
    resources :users, only: %i[index edit update destroy]
    resources :lessons, only: %i[new create edit update destroy], shallow: true do
      resources :lesson_dates, only: %i[index new create edit update destroy], module: :lessons, shallow: true do
        resources :reserved_users, only: %i[index], module: :lesson_dates
      end
    end
  end

  devise_for :users, controllers: {
    registrations: 'users/registrations',
  }
  root 'lessons#index'
  resource :my_page, only: %i[show]
  resources :lessons, only: %i[show] do
    resources :lesson_dates, only: %i[index], module: :lessons do
      resource :reservations, only: %i[create destroy], module: :lesson_dates
    end
  end
  get 'up' => 'rails/health#show', as: :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
