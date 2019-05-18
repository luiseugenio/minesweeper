require 'rails_helper'

RSpec.describe Flag, type: :model do

	let(:flag_question_mark) { Flag.new(Flag::TYPE[:question_mark]) }
	let(:flag_red_flag) { Flag.new(Flag::TYPE[:red_flag]) }

	describe 'initialize' do

    context 'with valid argument' do
		 it 'assigns a "Q" for a question_mark' do
     		expect(flag_question_mark.type).to eql("Q")
     end

     it 'assigns a "R" for a red_flag' do
     		expect(flag_red_flag.type).to eql("R")
     end
    end

	end

end