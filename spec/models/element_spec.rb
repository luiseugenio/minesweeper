require 'rails_helper'

RSpec.describe Element, type: :model do

	let(:element) { Element.new(1,2) }
	let(:flag_red_flag) { Flag.new(Flag::TYPE[:red_flag]) }

	describe 'initialize' do

		context 'with valid arguments' do
		 it 'assigns a Mine a false value' do
        expect(element.mine).to be false
      end

      it 'assigns all 2 arguments x, y' do
        expect(element.x).to eql(1)
        expect(element.y).to eql(2)
      end
    end

	end

	describe 'click' do

    it 'set revealed eql true' do
      element.click
      expect(element.revealed).to eql(true)
    end

	end

	describe 'flag' do

		context 'with valid arguments' do
			it 'instantiates a new Flag' do
        expect(element.flag(flag_red_flag)).to be_a(Flag)
      end
    end

	end

	describe 'flagged?' do

		context "flagged nil" do 
			before do
        element.flagged = nil
      end

			it 'returns false' do
				expect(element.flagged?).to eql(false)
    	end
		end

		context "flagged not nil" do 
			before do
        element.flagged = flag_red_flag
      end

			it 'returns true' do
				expect(element.flagged?).to eql(true)
    	end
		end

	end

end