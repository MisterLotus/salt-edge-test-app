module LoginsHelper
  # freeze constant to make it unchanged
  LOGIN_RELATIVE_URL = 'logins/'.freeze

  def LoginsHelper.create(params)
    data = {"data": {
        "customer_id": params[:customer_id],
        "country_code": "XF",
        "provider_code": "fake_bank_simple_xf",
        "fetch_scopes": [
            "accounts",
            "transactions"
        ],
        "credentials": {
            "login": params[:login],
            "password": params[:password]
        }
    }
    }

    return Saltedge.new.request('POST', LOGIN_RELATIVE_URL, data)
  end

  def LoginsHelper.refresh(params)
    url = LOGIN_RELATIVE_URL + params[:login_id] + "/refresh"
    data = {
        "data": {
            "fetch_scopes": [
                "accounts",
                "transactions"
            ]
        }
    }
    return Saltedge.new.request('PUT', url, data)

  end

  def LoginsHelper.reconnect(params)
    url = LOGIN_RELATIVE_URL + params[:login_id] + '/reconnect'
    data = {
        "data": {
            "credentials": {
                "login": params[:login],
                "password": params[:password]
            },
            "override_credentials": true
        }
    }
    api = Saltedge.new
    return api.request('PUT', url, data)

  end

  def LoginsHelper.destroy(params)
    url = LOGIN_RELATIVE_URL + params[:login_id] + '/destroy_credentials'
    return Saltedge.new.request('PUT', url)
  end

  def LoginsHelper.show(params)
    url = LOGIN_RELATIVE_URL + params[:login_id]
    return Saltedge.new.request('GET', url)
  end

  def LoginsHelper.show_all
    url = LOGIN_RELATIVE_URL
    return Saltedge.new.request('GET', url)
  end
end
