require "rspec"
require "byebug"
require_relative "account"

describe Account do

  let(:starting_balance) { 0 }
  let(:account_number)  { "1111111111" }
  let(:account) {Account.new(account_number, starting_balance ) }

  describe "#initialize" do
    context "with valid input" do 
    it "throws an argument error when not given a type argument" do 
      expect{Account.new}.to raise_error(ArgumentError)
      end
    end
  end 

  describe "transactions" do
    context "when account is created" do 
      it " has starting balance as its first transaction" do 
        expect(account.transactions[0]).to eq(starting_balance)
        end
     end 
  end

  describe "balance" do
   context "when a transaction is created" do
     it "adds all transactions together" do
      expect(account.balance).to eq(0)
       end
     end 
  end 

  describe "#acct_number" do
    context "when displaying account number" do 
      it "ensures the first six numbers are hidden" do 
        expect(account.acct_number).to eq("******1111")
        end
     end 
  end

  describe "deposit!" do
    context "when making a deposit" do 
      it "raises error if input is a negative integer" do 
        expect{account.deposit!(-50)}.to raise_error(NegativeDepositError)
        end
     end 
  end

  describe "#withdraw!" do
    context "when making a withdrawal" do 
      it "changes positive integer to a negative one to subtract that amount from the balance" do 
        account.deposit!(20)
        expect(account.withdraw!(20)).to eq(0)
        end
     end 
  end

end