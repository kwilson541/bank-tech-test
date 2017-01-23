require 'spec_helper'

describe Account do

	subject(:account) { described_class.new }

	context 'creating an account' do

		it 'creates a new account with zero balance' do
			expect(account.check_balance).to eq 0
		end
	end

	context 'making a transaction' do

		it 'allows a user to deposit money' do
			account.deposit(100.00)
			expect(account.check_balance).to eq 100.00
		end

		it 'allows a user to withdraw money' do
			account.withdraw(100.00)
			expect(account.check_balance).to eq -100.00
		end
	end
end