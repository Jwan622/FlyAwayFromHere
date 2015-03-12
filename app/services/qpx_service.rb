class QPXService
  attr_reader :connection
  attr_accessor :qpx_post

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/qpxExpress/v1")
  end

  def search
    response = connection.post do |req|
      req.url "trips/search?key=AIzaSyAaLHEBBLCI4aHLNu2jHiiAQGDbCunBQX0",
      req.headers['Content-Type'] = ['application/json']
      req.body = { request: {
         passengers: {
           adultCount: 1
         },
         slice: [
           {
             origin: "BOS",
             destination: "LAX",
             date: "2015-03-22"
           },
           {
             origin: "LAX",
             destination: "BOS",
             date: "2015-03-28"
           }
         ]
       }
     }.to_json
    end
    puts response.body
  end

  private

  def api_key
    ENV[:qpx_api_key]
  end

  def parse(response)
    JSON.parse(response)
  end
end
