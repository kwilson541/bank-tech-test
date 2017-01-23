require 'spec_helper'

describe Account do

	subject(:account) { described_class.new }

	context 'creating an account' do

		it 'creates a new account with zero balance' do
			expect(account.check_balance).to eq 0
		end
	end
end