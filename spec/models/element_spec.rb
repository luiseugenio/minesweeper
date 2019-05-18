require 'rails_helper'

RSpec.describe Element, type: :model do

	let(:element) { Element.new }

	describe 'initialize' do

		context 'with no arguments' do
		 it 'assigns a Mine a false value' do
        expect(element.mine).to be false
      end
    end

	end

end