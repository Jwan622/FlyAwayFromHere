class QPXStubbedJSON
  def self.qpx_data
    {
      "kind"=> "qpxExpress#tripsSearch",
      "trips"=> {
        "kind"=> "qpxexpress#tripOptions",
        "requestId"=> "stub",
        "data"=> {
          "kind"=> "qpxexpress#data",
          "airport"=> [
            {
              "kind"=> "qpxexpress#airportData",
              "code"=> "stub",
              "city"=> "stub",
              "name"=> "stub"
            }
          ],
          "city"=> [
            {
              "kind"=> "qpxexpress#cityData",
              "code"=> "stub",
              "country"=> "stub",
              "name"=> "stub"
            }
          ],
          "aircraft"=> [
            {
              "kind"=> "qpxexpress#aircraftData",
              "code"=> "stub",
              "name"=> "stub"
            }
          ],
          "tax"=> [
            {
              "kind"=> "qpxexpress#taxData",
              "id"=> "stub",
              "name"=> "stub"
            }
          ],
          "carrier"=> [
            {
              "kind"=> "qpxexpress#carrierData",
              "code"=> "stub",
              "name"=> "stub"
            }
          ]
        },
        "tripOption"=> [
          {
            "kind"=> "qpxexpress#tripOption",
            "saleTotal"=> "USD100",
            "id"=> "stub",
            "slice"=> [
              {
                "kind"=> "qpxexpress#sliceInfo",
                "duration"=> 1,
                "segment"=> [
                  {
                    "kind"=> "qpxexpress#segmentInfo",
                    "duration"=> 1,
                    "flight"=> {
                      "carrier"=> "UA",
                      "number"=> "stub"
                    },
                    "id"=> "stub",
                    "cabin"=> "stub",
                    "bookingCode"=> "stub",
                    "bookingCodeCount"=> 1,
                    "marriedSegmentGroup"=> "stub",
                    "subjectToGovernmentApproval"=> true,
                    "leg"=> [
                      {
                        "kind"=> "qpxexpress#legInfo",
                        "id"=> "stub",
                        "aircraft"=> "stub",
                        "arrivalTime"=> "2015-01-02",
                        "departureTime"=> "2015-01-01",
                        "origin"=> "NYC",
                        "destination"=> "DEN",
                        "originTerminal"=> "stub",
                        "destinationTerminal"=> "stub",
                        "duration"=> 1,
                        "operatingDisclosure"=> "stub",
                        "onTimePerformance"=> 1,
                        "mileage"=> 1,
                        "meal"=> "stub",
                        "secure"=> true,
                        "connectionDuration"=> 1,
                        "changePlane"=> true
                      }
                    ],
                    "connectionDuration"=> 1
                  }
                ]
              }
            ],
            "pricing"=> [
              {
                "kind"=> "qpxexpress#pricingInfo",
                "fare"=> [
                  {
                    "kind"=> "qpxexpress#fareInfo",
                    "id"=> "stub",
                    "carrier"=> "stub",
                    "origin"=> "stub",
                    "destination"=> "stub",
                    "basisCode"=> "stub",
                    "private"=> true
                  }
                ],
                "segmentPricing"=> [
                  {
                    "kind"=> "qpxexpress#segmentPricing",
                    "fareId"=> "stub",
                    "segmentId"=> "stub",
                    "freeBaggageOption"=> [
                      {
                        "kind"=> "qpxexpress#freeBaggageAllowance",
                        "bagDescriptor"=> [
                          {
                            "kind"=> "qpxexpress#bagDescriptor",
                            "commercialName"=> "stub",
                            "count"=> 1,
                            "description"=> [
                              "stub"
                            ],
                            "subcode"=> "stub"
                          }
                        ],
                        "kilos"=> 1,
                        "kilosPerPiece"=> 1,
                        "pieces"=> 1,
                        "pounds"=> 1
                      }
                    ]
                  }
                ],
                "baseFareTotal"=> "stub",
                "saleFareTotal"=> "stub",
                "saleTaxTotal"=> "stub",
                "saleTotal"=> "USD100",
                "passengers"=> {
                  "kind"=> "qpxexpress#passengerCounts",
                  "adultCount"=> 1,
                  "childCount"=> 1,
                  "infantInLapCount"=> 1,
                  "infantInSeatCount"=> 1,
                  "seniorCount"=> 1
                },
                "tax"=> [
                  {
                    "kind"=> "qpxexpress#taxInfo",
                    "id"=> "stub",
                    "chargeType"=> "stub",
                    "code"=> "stub",
                    "country"=> "stub",
                    "salePrice"=> "stub"
                  }
                ],
                "fareCalculation"=> "stub",
                "latestTicketingTime"=> "stub",
                "ptc"=> "stub",
                "refundable"=> true
              }
            ]
          }
        ]
      }
    }
  end
end
