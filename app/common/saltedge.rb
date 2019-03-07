require "json"
require "base64"
require "openssl"
require "digest"
require "rest-client"

class Saltedge
  attr_reader :app_id, :secret, :private_key
  EXPIRATION_TIME = 60
  BASE_URL = 'https://www.saltedge.com/api/v4/'

  def self.verify_signature(public_key, data, signature)
    public_key.verify(OpenSSL::Digest::SHA256.new, Base64.decode64(signature), data)
  end

  def initialize()
    #TODO transfer to config if hade time
    @app_id = 'mWGyfb43PyA0tgxhYncBOv1FkahmrAPpaQDvMBYbAe8'
    @secret = 'SbGk7RELzXXe8yzqSs6CC5Y2GV1ri0X7geIZLqJ1a8w'
    @private_key = OpenSSL::PKey::RSA.new(File.open(File.dirname(__FILE__) + '/private.pem'))
  end

  def request(method, url, params = {})
    #  optimize, trasnfer only relative PATH in url , add full PATH
    url = BASE_URL+url
    hash = {
        method: method,
        url: url,
        expires_at: (Time.now + EXPIRATION_TIME).to_i,
        params: as_json(params)
    }

     responce = JSON.parse(RestClient::Request.execute(
        method: hash[:method],
        url: hash[:url],
        payload: hash[:params],
        log: Logger.new(STDOUT),
        headers: {
            "Accept" => "application/json",
            "Content-type" => "application/json",
            "Expires-at" => hash[:expires_at],
            "Signature" => sign_request(hash),
            "App-Id" => app_id,
            "Secret" => secret
        }
    ))
    self.log_data(method, url, params,responce)
    return responce
  rescue RestClient::Exception => error
    responce = JSON.parse(error.response)
    self.log_data(method, url, params,responce)
    return responce
  end


  def sign_request(hash)
    data = "#{hash[:expires_at]}|#{hash[:method].to_s.upcase}|#{hash[:url]}|#{hash[:params]}"
    pp data
    Base64.encode64(private_key.sign(OpenSSL::Digest::SHA256.new, data)).delete("\n")
  end

  def as_json(params)
    return "" if params.empty?
    params.to_json
  end

  def log_data(method,url,input,output)
    log = Log.new
    log.timestamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    log.data = method+' | '+url+' | '+input.to_json.to_str+ ' | '+output.to_json.to_str
    log.save
  end



end