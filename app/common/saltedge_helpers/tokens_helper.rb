module TokensHelper
  # freeze constant to make it unchanged
  TOKEN_RELATIVE_URL = 'tokens/'.freeze

  def TokensHelper.create(params)
    url = TOKEN_RELATIVE_URL+'create'
    data = {
              "data": {
    "customer_id": params[:customer_id],
    "fetch_scopes": [
    "accounts",
    "transactions"
                ]
              }
            }
    responce = Saltedge.new.request('POST', url, data)
    if(responce.key?("data"))
      token = Token.new
      token.customer_id = params[:customer_id]
      token.token = responce["data"]["token"]
      token.expires_at = responce["data"]["expires_at"]
      token.connect_url = responce["data"]["connect_url"]
      token.save
    end
    return responce
  end


end
