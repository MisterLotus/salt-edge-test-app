
class MainController < ApplicationController


  def showMain

  end
  def createUser
      if(params[:email] && params[:password])
        @create_result = UsersHelper.create(params)
      end
  end
  def createToken
    if(params[:customer_id])
      @create_result = TokensHelper.create(params)
    end
  end

  def createLogin
    if(params[:login] && params[:password] && params[:customer_id])
      @create_result = LoginsHelper.create(params)
    end

  end
  def refreshLogin
    @all_logins = LoginsHelper.showAll['data']
    if(params[:login_id])
      @refresh_result = LoginsHelper.refresh(params)
    end

  end
  def reconnectLogin
    @all_logins = LoginsHelper.showAll['data']
    if(params[:login_id])
      @reconnect_result = LoginsHelper.reconnect(params)
    end
  end
  def destroyLogin
    @all_logins = LoginsHelper.showAll['data']
    if(params[:login_id])
      @destroy_result = LoginsHelper.destroy(params)
    end
  end
  def showLogin
    @all_logins = LoginsHelper.showAll['data']
    @show_result = nil
    if(params[:login_id] && params[:login_id]!="ALL")
      @show_result = LoginsHelper.show(params)
    else
      @show_result = @all_logins
    end
    return @show_result

  end
  def showAccounts
    @all_logins = LoginsHelper.showAll['data']
    if(params[:login_id])
      @show_result = AccountsHelper.showByLoginID(params)
    end
  end
  def showPostedTransactions
    # step 1 => Show Login Select, step 2 => show account select, step 3=> show transactions
    @all_logins = LoginsHelper.showAll['data']

    if(params[:login_id])
      @all_accounts = AccountsHelper.showByLoginID(params)['data']
    end

    if(params[:account_id] && params[:from_id])
      @acount_id = params[:account_id]
      @show_result = TransactionsHelper.showPosted(params)
    end

  end
  def showPendingTransactions
    # step 1 => Show Login Select, step 2 => show account select, step 3=> show transactions
    @all_logins = LoginsHelper.showAll['data']

    if(params[:login_id])
      @all_accounts = AccountsHelper.showByLoginID(params)['data']
    end

    if(params[:account_id] && params[:from_id])
      @acount_id = params[:account_id]
      @show_result = TransactionsHelper.showPeding(params)
    end


  end

  def showLogs

    @logs=Log.all.order('id DESC').limit(100)
  end

end
