Rails.application.routes.draw do

	# The priority is based upon order of creation:
	# first created -> highest priority.

	resources :photos
	root "photos#index"

	# Sample of regular route:
	#   match 'products/:id' => 'catalog#view'
	# Keep in mind you can assign values other than :controller and :action

end
