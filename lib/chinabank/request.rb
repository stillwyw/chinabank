module ChinaBank
  class Request

    attr_reader :respond, :respond_hash
    def initialize(url, options)
      @url = url
      @params = options
      @params[:merchantNum] = options[:merchantNum] || ChinaBank::Config.merchant_num
      @params[:deskey] = options[:deskey] || ChinaBank::Config.deskey
      @params[:merchantSign] = ChinaBank::Signature.sign(@params)
    end
    
    def send
      self.parse(HTTP.post(@url, body: @out_xml))
    end
    
    def post
      self.parse(HTTP.post(@url, body: @out_xml))
    end
    
    def parse(res)
      WechatPay::Signature.check_sign(@respond_hash = Hash.from_xml(res))
      WechatPay::Respond.new @respond_hash['xml']
    end
    
  end
  
end