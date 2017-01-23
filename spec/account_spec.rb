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

		before do
			allow(Time).to receive(:now).and_return(Time.parse("23/01/2017"))
		end

		it 'has an empty log on new accounts' do
			expect{account.print_statement}.to output("date      |credit    |debit     |balance   \n"\
													"23/01/2017|          |          |£0.00     \n").to_stdout
		end

		it 'displays deposit transactions a user makes' do
			account.deposit(100.00)
			expect{account.print_statement}.to output("date      |credit    |debit     |balance   \n"\
													"23/01/2017|          |          |£0.00     \n"\
													"23/01/2017|£100.00   |          |£100.00   \n").to_stdout
		end

		it 'displays withdraw transactions a user makes' do
			account.withdraw(100.00)
			expect{account.print_statement}.to output("date      |credit    |debit     |balance   \n"\
													"23/01/2017|          |          |£0.00     \n"\
													"23/01/2017|          |£100.00   |-£100.00  \n").to_stdout
		end
	end
end