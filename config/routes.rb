Rails.application.routes.draw do
	resources :days do
    resources :todo_lists do
      resources :todo_items do
        member do
          patch :complete
        end
      end
    end
	end

  root "days#index"
end
