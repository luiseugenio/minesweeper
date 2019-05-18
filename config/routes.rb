Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  namespace :api do
		namespace :v1 do
		  controller :games do
		    post '/minesweeper/create', to: 'games#create'
		    patch '/minesweeper/play/:x/:y', to: 'games#play', as: :minesweeper_play
		    patch '/minesweeper/flag/:x/:y', to: 'games#flag', as: :minesweeper_flag
		    get '/minesweeper/status', to: 'games#board_status', as: :minesweeper_status
		  end
		end
	end

end
