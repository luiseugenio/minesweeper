require 'rails_helper'

RSpec.describe Board, type: :model do
  
	let(:num_mines) { 10 }
	let(:board) { Board.new(6, 6, num_mines) }

	describe 'initialize' do

    context 'with valid arguments' do
      it 'assigns all 3 arguments x, y, num_mines' do
        expect(board.x).to eql(6)
        expect(board.y).to eql(6)
        expect(board.num_mines).to eql(num_mines)
      end

      it 'creates a Array of Arrays' do
        expect(board.elements).to be_an(Array)
        expect(board.elements.first).to be_an(Array)
        expect(board.elements.first.first).to be_a(Element)
      end

    end

	end
	
end