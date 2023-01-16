class AccountRepository
    def all
        sql = 'SELECT id, email_address, username FROM accounts;'
        result_set = DatabaseConnection.exec_params(sql, [])
        accounts = []
        result_set.each { |record| 
        account = Account.new
        account.id = record['id']
        account.email_address = record['email_address']
        account.username = record['username']
        accounts << account}
        return accounts
    end

    def find(id)
        sql = 'SELECT id, email_address, username FROM accounts WHERE id = $1;'
        sql_params = [id]
        result_set = DatabaseConnection.exec_params(sql, sql_params)
        record = result_set[0]
        account = Account.new
        account.id = record['id']
        account.email_address = record['email_address']
        account.username = record['username']
        return account
    end
    def create(account)
        sql = 'INSERT INTO accounts (email_address, username) VALUES ($1, $2);'
        sql_params = [account.email_address, account.username]
        DatabaseConnection.exec_params(sql, sql_params)
    end
    def update(account)
        sql = 'UPDATE accounts SET username = $1 WHERE id = $2;'
        sql_params = [account.username, account.id]
        DatabaseConnection.exec_params(sql, sql_params)
    end
    def delete(id)
        sql = 'DELETE FROM accounts WHERE id = $1;'
        sql_params = [id]
        DatabaseConnection.exec_params(sql, sql_params)
    end
end