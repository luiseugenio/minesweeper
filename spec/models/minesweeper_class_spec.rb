require 'rails_helper'

RSpec.describe MinesweeperClass, type: :model do

  let(:minesweeper) { MinesweeperClass.new(6, 6, 10) }

  describe 'initialize' do
  	
  	context 'with valid arguments' do
      it 'instantiates a new Board' do
        expect(minesweeper.board).to be_a(Board)
      end
    end

    context 'with invalid arguments' do
      before do
        minesweeper_invalid = MinesweeperClass.new(6, 6, 100)
      end

      it 'raises an error' do
        expect {
          MinesweeperClass.new
        }.to raise_error(ArgumentError, 'too many mines')
      end
    end

    context 'without arguments' do
      it 'raises an error' do
        expect {
          MinesweeperClass.new
        }.to raise_error(ArgumentError, 'wrong number of arguments (given 0, expected 3)')
      end
    end
	
	end

end