class GAMeasurements
  require 'httparty'
  require 'uuid'

  include HTTParty

  TYPES = %w(pageview event item transaction socia exception timing appview)
  API_VERSION = 1
  API_ENDPOINT = "https://ssl.google-analytics.com/collect"

  attr_accessor :property_id, :client_id

  def initialize(property_id, client_id = UUID.new.generate)
    @property_id, @client_id = property_id, client_id
  end

  TYPES.each do |type|
    define_method(type){ |params| post(type, params) }
  end

  private

  def post(type, params)
    payload = params.merge({t: type, tid: property_id, cid: client_id, v: API_VERSION})

    response = self.class.post(API_ENDPOINT, { body: payload })
  end
end
