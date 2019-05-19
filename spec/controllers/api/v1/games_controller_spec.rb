require 'rails_helper'

RSpec.describe Api::V1::GamesController, type: :controller do

	let(:valid_attributes) { { x_size: 10, y_size: 10, qtd_mines: 2 } }
	
	describe 'POST /api/v1/games' do

		context 'when the request is valid' do
			before { post :create, params: valid_attributes }

			it 'returns status code created(201)' do
	      expect(response).to have_http_status(201)
	    end
	    
		end

		context 'when the request is invalid' do
			let(:params) { { x_size: 10, y_size: 10, qtd_mines: 1000 } }

      before { post :create, params: params }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body).to match(/Game cannot be created/)
      end
    end	

	end

	describe 'PATCH /api/v1/games/play' do
    
    context 'when request attributes are valid' do
    	let(:params) { { x: 2, y: 1 } }

	  	before do 
	    	post :create, params: valid_attributes
	    	post :play, params: params
	    end

      it 'returns status code ok(200)' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
    	let(:params) { {x: 100, y: 200} }

	  	before do 
	    	post :create, params: valid_attributes
	    	post :play, params: params
	    end

      it 'returns status code unprocessable_entity(422)' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Yor move is not valid/)
      end
    end
  end

  describe 'post /api/v1/games/flag' do

    context 'when request attributes are valid' do
	  	let(:params) { { x: 2, y: 1, type: 'red_flag' } }

	  	before do 
	    	post :create, params: valid_attributes
	    	post :flag, params: params
	    end

      it 'returns status code ok(200)' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when an invalid request' do
    	let(:params) { { x: 2, y: 1 } }

    	before do 
      	post :create, params: valid_attributes
      	post :flag, params: params
      end

      it 'returns status code unprocessable_entity(422)' do
        expect(response).to have_http_status(422)
      end

      it 'returns a failure message' do
        expect(response.body).to match(/Yor move is not valid/)
      end
    end
  end

  describe 'GET /api/v1/games/status' do

    context 'when request attributes are valid' do

      before do 
      	post :create, params: valid_attributes
      	get :board_status 
      end

      it 'returns status code ok(200)' do
        expect(response).to have_http_status(200)
      end
    end

  end

end