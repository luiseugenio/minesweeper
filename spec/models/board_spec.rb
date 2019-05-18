require 'rails_helper'

RSpec.describe Board, type: :model do
  
	let(:qtd_mines) { 2 }
	let(:board) { Board.new(6, 6, qtd_mines) }

	describe 'initialize' do

    context 'with valid arguments' do
      it 'assigns all 3 arguments x, y, qtd_mines' do
        expect(board.x).to eql(6)
        expect(board.y).to eql(6)
        expect(board.qtd_mines).to eql(qtd_mines)
      end

      it 'creates a elements Array of Arrays' do
        expect(board.elements).to be_an(Array)
        expect(board.elements.first).to be_an(Array)
        expect(board.elements.first.first).to be_a(Element)
      end

      it 'creates a mines Array of Elements' do
        expect(board.mines).to be_an(Array)
        expect(board.mines.first).to be_a(Element)
      end
    end

	end

  describe 'click' do
    context 'on a mine' do
      it 'returns mine' do
        expect(
          board.click(board.mines.first.x, board.mines.first.y)
        ).to eql('mine')
      end
    end

    context 'on a revealed element' do
      before do
        board.elements[0][0].revealed = true
      end

      it 'returns revealed' do
        expect(board.click(0, 0)).to eql('revealed')
      end
    end

    context 'on a non-revealed tile' do
      before do
        board.elements.first.first.revealed = false
      end

      it 'sets revealed eql true' do
        board.click(0, 0)
        expect(board.elements[0][0].revealed).to eql(true)
      end
    end
end

  describe 'status' do
    it 'show actual state of Board' do
      expect(board.status).to be_a(String)
      expect(board.status.length).to eql(42)
    end
  end
	
end