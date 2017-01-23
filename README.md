```
               \`\/\/\/`/
                )======(
              .'        '.
             /    _||__   \
            /    (_||_     \
           |     __||_)     |
           |       ||       |
           '.              .'
             '------------'
```

Bank Tech Test
==============

Specification
-------------
- User can create a new account with an opening balance of £0.00
- User can check balance
- User can make a deposit
- User can make a withdrawal
- User can print a formatted statement, detailing their transaction history

User Stories
------------

```
As a user,
So that I can keep track of my money,
I would like to open a bank account.
```
```
As a user,
So that I can get some cash,
I want to be able to withdraw money from my account.
```
```
As a user,
So that I can keep my bank account healthy,
I want to be able to make a deposit.
```
```
As a user,
So that I can see how much money I have been spending or depositing,
I want to be able to view an account statement.
```

How to Use
----------
- Fork this repository
- Clone the forked repository to your machine
- Open a terminal and navigate to the project folder
- Run `irb` or `pry`
- Require `./lib/account`

###Create an Account
```
account = Account.new
```

###Check balance
```
account.check_balance
=> "£0.00"
```

###Deposit money
```
account.deposit(1000.00)
```

###Withdraw money
```
account.withdraw(500.00)
```

###Print statement
```
account.print_statement
date      |credit    |debit     |balance
23/01/2017|          |          |£0.00
23/01/2017|£1000.00  |          |£1000.00
23/01/2017|          |£500.00   |£500.00
```

Future Considerations
---------------------
- Put a limit on deposit and withdrawal amounts
- Introduce overdrafts and prevent withdrawals when account reaches the overdraft limit

Technologies
------------
This program was written in Ruby and built using TDD. RSpec was used for testing. To run the tests, navigate to the repository directory in your terminal, run `bundle` to install the RSpec gem (if you do not have bundle, run `install bundle` first), run `rspec` to see tests.