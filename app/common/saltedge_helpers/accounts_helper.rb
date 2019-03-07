module AccountsHelper
  ACCOUNT_RELATIVE_URL = 'accounts'.freeze

  def AccountsHelper.showByLoginID(params)
    url = ACCOUNT_RELATIVE_URL + '/?login_id='+params[:login_id]
    return Saltedge.new.request('GET', url)
  end

  def AccountsHelper.showAll
    url = ACCOUNT_RELATIVE_URL
    responce = Saltedge.new.request('GET', url)
    puts responce
    return responce
  end
end