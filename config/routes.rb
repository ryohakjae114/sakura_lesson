Rails.application.routes.draw do
  devise_for :admins
  devise_for :users
  root 'lessons#index'
  get 'up' => 'rails/health#show', as: :rails_health_check

  if Rails.env.development?
    mount LetterOpenerWeb::Engine, at: '/letter_opener'
  end
end
