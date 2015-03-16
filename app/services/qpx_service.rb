class QPXService
  attr_reader :connection
  attr_accessor :qpx_post

  def initialize
    @connection = Faraday.new(url: "https://www.googleapis.com/qpxExpress/v1")
  end

  def search(destination, origin, departure_date, return_date, max_price)
    response = parse(connection.post do |request|
      request.url "trips/search", key: Figaro.env.qpx_api_key
      request.headers['Content-Type'] = ['application/json']
      request.body = { request: {
        passengers: {
          adultCount: 1,
          infantInLapCount: 0,
          seniorCount: 0
        },
        slice: [
          {
            origin: origin,
            destination: destination,
            date: departure_date,
            maxStops: 0
          },
          {
            origin: destination,
            destination: origin,
            date: return_date,
            maxStops: 0
          }
        ],
        maxPrice: max_price,
        solutions: 6
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
