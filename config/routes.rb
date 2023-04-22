Rails.application.routes.draw do
  resources :messages
  root "pages#home"
  
  # Static Pages
  get 'how-to-become-a-pilot', to: 'pages#become_a_pilot', as: :become
  get 'pilot-programs', to: 'pages#pilot_programs', as: :programs
  get 'aircraft-rental', to: 'pages#aircraft_rental', as: :aircraft_rental
  get 'fixed-wing-airplane-fleet', to: 'pages#fixed_wing', as: :fixed_wing
  get 'rotary-wing-helicopter-fleet', to: 'pages#rotary_wing', as: :rotary_wing
  get 'airplane-pilot-training', to: 'pages#airplane_training', as: :airplane_training
  get 'helicopter-pilot-training', to: 'pages#helicopter_training', as: :helicopter_training
  get 'private-pilot-training', to: 'pages#private_pilot', as: :private_pilot
  get 'about-ideal-aviation', to: 'pages#about_us', as: :about_us
  get 'advanced_training', to: 'pages#advanced_training', as: :advanced_training
  get 'our-team', to: 'pages#our_team', as: :our_team
  get 'pilot-resources', to: 'pages#pilot_resources', as: :pilot_resources
  get 'careers', to: 'pages#careers', as: :careers

end
