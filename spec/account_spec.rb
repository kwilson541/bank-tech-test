require 'spec_helper'

describe Account do

	subject(:account) { described_class.new }

	context 'creating an account' do

		it 'creates a new account with zero balance' do
			expect(account.check_balance).to eq "£0.00"
		end
	end

	context 'making a transaction' do

		it 'allows a user to deposit money' do
			account.deposit(100.00)
			expect(account.check_balance).to eq "£100.00"
		end

		it 'allows a user to withdraw money' do
			account.withdraw(100.00)
			expect(account.check_balance).to eq "-£100.00"
		end
	end

	context 'logging transactions' do

		it 'has an empty log on new accounts' do
			expect(account.print_statement).to eq "date      |credit    |debit     |balance   \n23/01/2017|          |          |£0.00     \n"
		end
	end
end