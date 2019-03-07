module TransactionsHelper
  TRANSACTIONS_RELATIVE_URL = 'transactions'.freeze

  def TransactionsHelper.showPosted(params)
    url = TRANSACTIONS_RELATIVE_URL + '?account_id='+params[:account_id]+'&from_id='+params[:from_id]
    return Saltedge.new.request('GET', url)
  end

  def TransactionsHelper.showPeding(params)
    url = TRANSACTIONS_RELATIVE_URL + '/pending?account_id='+params[:account_id]+'&from_id='+params[:from_id]
    return Saltedge.new.request('GET', url)
  end
end

