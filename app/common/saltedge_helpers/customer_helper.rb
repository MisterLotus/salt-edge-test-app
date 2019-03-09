module CustomerHelper
  CUSTOMER_RELATIVE_URL = 'customers/'.freeze

  def CustomerHelper.create_customer(params)

    data = {"data": {"identifier": params[:email]}}
    return Saltedge.new.request('POST', CUSTOMER_RELATIVE_URL, data)
  end


end
