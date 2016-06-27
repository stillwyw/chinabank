module ChinaBank
  module Helpers
    # process params for jd requirement.
    def self.prepare_params(params)
      processed_params = {}
      params.each do |k,v|
        # split ruby version of variable names into camalized
        k = k.split("_").collect{|str| self.upcase_first_letter(str) }.join("")
        k[0] = k[0].downcase
        processed_params[k] = v
      end
      processed_params
    end
    
    def self.downcase_first_letter(str)
      str[0] = str[0].downcase
      str
    end
    
    def self.upcase_first_letter(str)
      str[0] = str[0].upcase
      str
    end
    
    def self.require_params(required_params=[], current_params=[])
      required_params += [:merchant_sign, :merchant_num]
      required_params.each do |param|
        raise "param #{param} is required for this API" unless current_params.include?(param)
      end
    end
  end
end