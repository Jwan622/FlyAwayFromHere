require 'pp'

class QPXService
  attr_reader :connection
  attr_accessor :qpx_post

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/qpxExpress/v1")
  end

  def search(origin_airport, destination_airport, departure_date, max_price)
    response = parse(connection.post do |req|
      req.url "trips/search", key: "AIzaSyAaLHEBBLCI4aHLNu2jHiiAQGDbCunBQX0"
      req.headers['Content-Type'] = ['application/json']
      req.body = { request: {
        passengers: {
          adultCount: 1,
          infantInLapCount: 0,
          seniorCount: 0
        },
        slice: [
          {
            origin: origin_airport,
            destination: destination_airport,
            date: departure_date,
            maxStops: 0
          }
        ],
        maxPrice: max_price,
        solutions: 2
        }
      }.to_json
    end
    )
  end

  private

  def api_key
    ENV[:qpx_api_key]
  end

  def parse(response)
    JSON.parse(response.body)
  end
end
