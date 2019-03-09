class CallBackController < ApplicationController
  # no need side menu or something else, pure json in view
  layout false

  def handle
    @log = Log.new
    @log.timestamp = DateTime.now.strftime('%Y-%m-%d %H:%M:%S')
    @log.data = params.to_json
    @log.save
  end
end
