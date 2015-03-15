class QPXJSONRequest
  def self.json_request
    { request: {
      passengers: {
        adultCount: 1,
        infantInLapCount: 0,
        seniorCount: 0
      },
      slice: [
        {
          origin: "NYC",
          destination: "LAS",
          date: "2015-03-28",
          maxStops: 0
        },
        {
          origin: "LAS",
          destination: "NYC",
          date: "2015-04-03",
          maxStops: 0
        }
      ],
      maxPrice: "USD4000",
      solutions: 1
      }
    }.to_json
  end
end
