Rails.application.routes.draw do
  # get 'attendances/index'
  # get 'attendances/show'
  # get 'attendances/new'
  # get 'attendances/edit'
  # get 'employees/index'
  # get 'employees/show'
  # get 'employees/new'
  # get 'employees/edit'

  # Esta línea añade todas las rutas CRUD necesarias para empleados
  resources :employees
  # Esta línea añade todas las rutas CRUD necesarias para asistencias
  resources :attendances

  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Defines the root path route ("/")
  # root "posts#index"
  # Opcional: Define una ruta raíz, por ejemplo, para listar empleados
  root "employees#index"
end
