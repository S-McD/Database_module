require "account_repository"
require "account"

def reset_accounts_table
    seed_sql = File.read('spec/seeds_accounts.sql')
    connection = PG.connect({ host: '127.0.0.1', dbname: 'social_network' })
    connection.exec(seed_sql)
end
  
RSpec.describe AccountRepository do
    before(:each) do 
      reset_accounts_table
    end
  
    it "Get all accounts" do
    repo = AccountRepository.new
    accounts = repo.all
    expect(accounts.length).to eq 2
    expect(accounts[0].id).to eq '1'
    expect(accounts[0].username).to eq '1234new'
    expect(accounts[1].id).to eq '2'
    expect(accounts[1].email_address).to eq '5678@hotmail.com'
    end

    it "Gets a single account" do
        repo = AccountRepository.new
        account = repo.find(1)
        expect(account.id).to eq '1'
        expect(account.email_address).to eq '1234@yahoo.com'
        expect(account.username).to eq '1234new'
    end

    it "Creates a new account" do
        repo = AccountRepository.new
        new_acc = Account.new
        new_acc.email_address = '9012@gmail.com'
        new_acc.username = 'Noobie'
        repo.create(new_acc)
        accounts = repo.all
        expect(accounts.last.id).to eq '3'
        expect(accounts.last.email_address).to eq '9012@gmail.com'
        expect(accounts.last.username).to eq 'Noobie'
    end

    it "Updates an account" do
        repo = AccountRepository.new
        account = repo.find(1)
        account.username = 'Bobbles'
        repo.update(account)
        expect(account.username).to eq 'Bobbles'
    end

    it "Deletes an account" do
        repo = AccountRepository.new
        repo.delete(2)
        accounts = repo.all
        expect(accounts.length).to eq 1
    end
end