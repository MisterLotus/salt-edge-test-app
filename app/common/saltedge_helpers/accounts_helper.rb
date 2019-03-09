module AccountsHelper
  ACCOUNT_RELATIVE_URL = 'accounts'.freeze

  def AccountsHelper.show_by_login_id(params)
    url = ACCOUNT_RELATIVE_URL + '/?login_id=' + params[:login_id]
    return Saltedge.new.request('GET', url)
  end

  def AccountsHelper.show_all
    url = ACCOUNT_RELATIVE_URL
    responce = Saltedge.new.request('GET', url)
    puts responce
    return responce
  end
end