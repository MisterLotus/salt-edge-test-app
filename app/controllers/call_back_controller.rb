class CallBackController < ApplicationController
  def process
      @log = Log.new
      @log.timestamp = date('now')
      @log.data = params.to_json
      @log.save
  end
end
