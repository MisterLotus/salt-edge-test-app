module UsersHelper
  #  no need to create separate Customer controller, we need only once create and only on user creation
  def UsersHelper.create(params)
    encrypted_password = BCrypt::Password.create(params[:password])

    user = User.new(:email => params[:email], :password => encrypted_password)

    # check if user exists already
    responce = CustomerHelper.create_customer(params)

    if responce.key?("data")
      customer = Customer.new
      customer.identifier = responce["data"]["identifier"]
      customer.secret = responce["data"]["secret"]
      customer.customer_id = responce["data"]["id"]
      if customer.save
        user.save
      end
    end
    return responce
  end
end
