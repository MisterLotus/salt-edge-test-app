class MainController < ApplicationController


  def show_main

  end

  def create_user
    if params[:email] && params[:password]
      @create_result = UsersHelper.create(params)
    end
  end

  def create_token
    if params[:customer_id]
      @create_result = TokensHelper.create(params)
    end
  end

  def create_login
    if params[:login] && params[:password] && params[:customer_id]
      @create_result = LoginsHelper.create(params)
    end

  end

  def refresh_login
    @all_logins = LoginsHelper.show_all['data']
    if params[:login_id]
      @refresh_result = LoginsHelper.refresh(params)
    end

  end

  def reconnect_login
    @all_logins = LoginsHelper.show_all['data']
    if params[:login_id]
      @reconnect_result = LoginsHelper.reconnect(params)
    end
  end

  def destroy_login
    @all_logins = LoginsHelper.show_all['data']
    if params[:login_id]
      @destroy_result = LoginsHelper.destroy(params)
    end
  end

  def show_login
    @all_logins = LoginsHelper.show_all['data']
    @show_result = nil
    if params[:login_id] && params[:login_id] != "ALL"
      @show_result = LoginsHelper.show(params)
    else
      @show_result = @all_logins
    end

  end

  def show_accounts
    @all_logins = LoginsHelper.show_all['data']
    if params[:login_id]
      @show_result = AccountsHelper.show_by_login_id(params)
    end
  end

  def show_posted_transactions
    # step 1 => Show Login Select, step 2 => show account select, step 3=> show transactions
    @all_logins = LoginsHelper.show_all['data']

    if params[:login_id]
      @all_accounts = AccountsHelper.show_by_login_id(params)['data']
    end

    if params[:account_id] && params[:from_id]
      @acount_id = params[:account_id]
      @show_result = TransactionsHelper.show_posted(params)
    end

  end

  def show_pending_transactions
    # step 1 => Show Login Select, step 2 => show account select, step 3=> show transactions
    @all_logins = LoginsHelper.show_all['data']

    if params[:login_id]
      @all_accounts = AccountsHelper.show_by_login_id(params)['data']
    end

    if params[:account_id] && params[:from_id]
      @acount_id = params[:account_id]
      @show_result = TransactionsHelper.show_pending(params)
    end


  end

  def show_logs

    @logs = Log.all.order('id DESC').limit(100)
  end

end
