class Account

	def initialize
		@balance = OPENING_BALANCE
		@transaction_log = []
		new_transaction(nil, nil)
	end

	def check_balance
		return "£%.2f" % @balance if @balance >= OPENING_BALANCE
		"-£%.2f" % @balance.abs
	end

	def deposit(amount)
		@balance += amount
		new_transaction("credit", amount)
	end

	def withdraw(amount)
		@balance -= amount
		new_transaction("debit", amount)
	end

	def print_statement
		generate_statement
	end

	private

		OPENING_BALANCE = 0
		COLUMN_WIDTH = 10

		attr_reader :balance

		def new_transaction(type, amount)
			credit = ""
			debit = ""
			credit = "£%.2f" % amount if type == "credit"
			debit = "£%.2f" % amount if type == "debit"
			@transaction_log << { date: get_date, credit: credit, debit: debit, balance: check_balance }
		end

		def get_date
			Time.now.strftime("%d/%m/%Y")
		end

		def generate_statement
			statement = statement_header
			@transaction_log.each { |transaction|
				statement += "#{transaction[:date]}|"\
							"#{format_column(transaction[:credit])}|"\
							"#{format_column(transaction[:debit])}|"\
							"#{format_column(transaction[:balance])}\n"
			}
			statement
		end

		def statement_header
			"#{format_column("date")}|#{format_column("credit")}|"\
			"#{format_column("debit")}|#{format_column("balance")}\n"
		end

		def format_column(data)
			whitespace = COLUMN_WIDTH - data.length if data.length < COLUMN_WIDTH
			data += " " * whitespace 
		end

end