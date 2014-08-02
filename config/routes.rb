Ecorpm::Application.routes.draw do

  resources :sensors, defaults: { format: 'json' }

end
