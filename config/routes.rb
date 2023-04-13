Rails.application.routes.draw do
  root "pages#home"
  
  # Static Pages
  get 'how-to-become-a-pilot', to: 'pages#become_a_pilot', as: :become
  get 'pilot-programs', to: 'pages#pilot_programs', as: :programs
  get 'aircraft-rental', to: 'pages#aircraft_rental', as: :aircraft_rental

end
