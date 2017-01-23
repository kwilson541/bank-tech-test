require 'spec_helper'

describe Account do

	context 'creating an account' do

		it 'creates a new account with zero balance' do
			account = Account.new
			expect(account.check_balance).to eq 0
		end

	end

end