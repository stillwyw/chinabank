require "chinabank/version"
require "chinabank/helpers"
module Chinabank
  module Config
    class << self
      attr_accessor :merchant_num, :deskey
    end
  end
  
  module API
    
    VERSION = 2.0
    
    def self.pay(params={})
      Helpers.require_params([:trade_num, :trade_name, :trade_amount, :success_callback_url, :fail_callback_url, :notify_url], params.keys)
      url = "https://m.jdpay.com/wepay/web/pay"
      
      params[:version] = VERSION
      
      params = Helpers.process_params(params)
      method = :post
      
      ChinaBank::Request.new(url)
    end
    
  end
end
