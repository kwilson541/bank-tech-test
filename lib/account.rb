class Account

	OPENING_BALANCE = 0

	attr_reader :balance

	def initialize
		@balance = OPENING_BALANCE
	end

	def check_balance
		@balance
	end

	def deposit(amount)
		@balance += amount
	end

	def withdraw(amount)
		@balance -= amount
	end

end