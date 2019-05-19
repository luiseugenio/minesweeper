class Api::V1::GamesController < ApplicationController

	def create
		begin
			@game = MinesweeperClass.new(params[:x_size].to_i, params[:y_size].to_i, params[:qtd_mines].to_i)
			render json: {status: 'SUCCESS', message:'Game created'}, status: :created
		rescue
			render json: {status: 'ERROR', message:'Game cannot be created'},status: :unprocessable_entity
		end
	end

	def play
		begin
			@game.play(params[:x].to_i, params[:y].to_i)
			render json: {status: 'SUCCESS', message:'You Played'}, status: :ok
		rescue
			render json: {status: 'ERROR', message:'Yor move is not valid'},status: :unprocessable_entity
		end
	end

	def flag
		begin
			@game.flag(params[:x].to_i, params[:y].to_i, params[:type])
			render json: {status: 'SUCCESS', message:'You Flag'}, status: :ok
		rescue
			render json: {status: 'ERROR', message:'Yor move is not valid'},status: :unprocessable_entity
		end
	end

	def board_status
		render json: {status: 'SUCCESS', message:'You Flag'}, status: :ok
	end

end