class QPXStubbedJSON
  #this is real data from qpx from JFK to LAS
  # where the departure date is "2015-03-29", return_date is "2015-04-18", and max_price is "USD5000"

  def self.qpx_data
    {"kind"=>"qpxExpress#tripsSearch",
     "trips"=>
      {"kind"=>"qpxexpress#tripOptions",
       "requestId"=>"N3hS5HQ6AmYB1v8Qi0Lldo",
       "data"=>
        {"kind"=>"qpxexpress#data",
         "airport"=>
          [{"kind"=>"qpxexpress#airportData",
            "code"=>"JFK",
            "city"=>"NYC",
            "name"=>"New York John F Kennedy International"},
           {"kind"=>"qpxexpress#airportData",
            "code"=>"LAS",
            "city"=>"LAS",
            "name"=>"Las Vegas McCarran International"}],
         "city"=>
          [{"kind"=>"qpxexpress#cityData", "code"=>"LAS", "name"=>"Las Vegas"},
           {"kind"=>"qpxexpress#cityData", "code"=>"NYC", "name"=>"New York"}],
         "aircraft"=>
          [{"kind"=>"qpxexpress#aircraftData",
            "code"=>"320",
            "name"=>"Airbus A320"}],
         "tax"=>
          [{"kind"=>"qpxexpress#taxData",
            "id"=>"ZP",
            "name"=>"US Flight Segment Tax"},
           {"kind"=>"qpxexpress#taxData",
            "id"=>"XF",
            "name"=>"US Passenger Facility Charge"},
           {"kind"=>"qpxexpress#taxData",
            "id"=>"US_001",
            "name"=>"US Transportation Tax"},
           {"kind"=>"qpxexpress#taxData",
            "id"=>"AY_001",
            "name"=>"US September 11th Security Fee"}],
         "carrier"=>
          [{"kind"=>"qpxexpress#carrierData",
            "code"=>"B6",
            "name"=>"Jetblue Airways Corporation"}]},
       "tripOption"=>
        [{"kind"=>"qpxexpress#tripOption",
          "saleTotal"=>"USD689.95",
          "id"=>"FmKieS3maMHOhZ1JoS4mAP001",
          "slice"=>
           [{"kind"=>"qpxexpress#sliceInfo",
             "duration"=>350,
             "segment"=>
              [{"kind"=>"qpxexpress#segmentInfo",
                "duration"=>350,
                "flight"=>{"carrier"=>"B6", "number"=>"411"},
                "id"=>"Gx691LPB7PxZYxpp",
                "cabin"=>"COACH",
                "bookingCode"=>"B",
                "bookingCodeCount"=>1,
                "marriedSegmentGroup"=>"0",
                "leg"=>
                 [{"kind"=>"qpxexpress#legInfo",
                   "id"=>"LPLCtteXJerjspB2",
                   "aircraft"=>"320",
                   "arrivalTime"=>"2015-03-29T12:45-07:00",
                   "departureTime"=>"2015-03-29T09:55-04:00",
                   "origin"=>"JFK",
                   "destination"=>"LAS",
                   "originTerminal"=>"5",
                   "destinationTerminal"=>"3",
                   "duration"=>350,
                   "onTimePerformance"=>70,
                   "mileage"=>2241,
                   "secure"=>true}]}]},
            {"kind"=>"qpxexpress#sliceInfo",
             "duration"=>288,
             "segment"=>
              [{"kind"=>"qpxexpress#segmentInfo",
                "duration"=>288,
                "flight"=>{"carrier"=>"B6", "number"=>"712"},
                "id"=>"G82YCLaCc1qq58Gn",
                "cabin"=>"COACH",
                "bookingCode"=>"M",
                "bookingCodeCount"=>4,
                "marriedSegmentGroup"=>"1",
                "leg"=>
                 [{"kind"=>"qpxexpress#legInfo",
                   "id"=>"Li5EuYv+UVkOPCte",
                   "aircraft"=>"320",
                   "arrivalTime"=>"2015-04-19T04:55-04:00",
                   "departureTime"=>"2015-04-18T21:07-07:00",
                   "origin"=>"LAS",
                   "destination"=>"JFK",
                   "originTerminal"=>"3",
                   "destinationTerminal"=>"5",
                   "duration"=>288,
                   "onTimePerformance"=>70,
                   "mileage"=>2241,
                   "secure"=>true}]}]}],
          "pricing"=>
           [{"kind"=>"qpxexpress#pricingInfo",
             "fare"=>
              [{"kind"=>"qpxexpress#fareInfo",
                "id"=>"AhmR1HxQWRNAah61yspO/KqRzYfeiCLaHmMFJNZBu0RU",
                "carrier"=>"B6",
                "origin"=>"NYC",
                "destination"=>"LAS",
                "basisCode"=>"BH07AE5U"},
               {"kind"=>"qpxexpress#fareInfo",
                "id"=>"AANblURon9b4yMop/Z+P/owRo6ugY5h9U9dKjNIjzHWI",
                "carrier"=>"B6",
                "origin"=>"LAS",
                "destination"=>"NYC",
                "basisCode"=>"MH14AE5U"}],
             "segmentPricing"=>
              [{"kind"=>"qpxexpress#segmentPricing",
                "fareId"=>"AANblURon9b4yMop/Z+P/owRo6ugY5h9U9dKjNIjzHWI",
                "segmentId"=>"G82YCLaCc1qq58Gn",
                "freeBaggageOption"=>
                 [{"kind"=>"qpxexpress#freeBaggageAllowance",
                   "bagDescriptor"=>
                    [{"kind"=>"qpxexpress#bagDescriptor",
                      "commercialName"=>"UPTO50LB 23KG AND62LI 158LCM",
                      "count"=>1,
                      "description"=>["Up to 50 lb/23 kg", "Up to 62 li/158 lcm"],
                      "subcode"=>"0GO"}],
                   "pieces"=>1}]},
               {"kind"=>"qpxexpress#segmentPricing",
                "fareId"=>"AhmR1HxQWRNAah61yspO/KqRzYfeiCLaHmMFJNZBu0RU",
                "segmentId"=>"Gx691LPB7PxZYxpp",
                "freeBaggageOption"=>
                 [{"kind"=>"qpxexpress#freeBaggageAllowance",
                   "bagDescriptor"=>
                    [{"kind"=>"qpxexpress#bagDescriptor",
                      "commercialName"=>"UPTO50LB 23KG AND62LI 158LCM",
                      "count"=>1,
                      "description"=>["Up to 50 lb/23 kg", "Up to 62 li/158 lcm"],
                      "subcode"=>"0GO"}],
                   "pieces"=>1}]}],
             "baseFareTotal"=>"USD615.58",
             "saleFareTotal"=>"USD615.58",
             "saleTaxTotal"=>"USD74.37",
             "saleTotal"=>"USD689.95",
             "passengers"=>{"kind"=>"qpxexpress#passengerCounts", "adultCount"=>1},
             "tax"=>
              [{"kind"=>"qpxexpress#taxInfo",
                "id"=>"US_001",
                "chargeType"=>"GOVERNMENT",
                "code"=>"US",
                "country"=>"US",
                "salePrice"=>"USD46.17"},
               {"kind"=>"qpxexpress#taxInfo",
                "id"=>"AY_001",
                "chargeType"=>"GOVERNMENT",
                "code"=>"AY",
                "country"=>"US",
                "salePrice"=>"USD11.20"},
               {"kind"=>"qpxexpress#taxInfo",
                "id"=>"XF",
                "chargeType"=>"GOVERNMENT",
                "code"=>"XF",
                "country"=>"US",
                "salePrice"=>"USD9.00"},
               {"kind"=>"qpxexpress#taxInfo",
                "id"=>"ZP",
                "chargeType"=>"GOVERNMENT",
                "code"=>"ZP",
                "country"=>"US",
                "salePrice"=>"USD8.00"}],
             "fareCalculation"=>
              "NYC B6 LAS Q15.34 383.61BH07AE5U B6 NYC 216.63MH14AE5U USD 615.58 END ZP JFK LAS XT 46.17US 8.00ZP 11.20AY 9.00XF JFK4.50 LAS4.50",
             "latestTicketingTime"=>"2015-03-17T23:59-04:00",
             "ptc"=>"ADT"
             }
           ]
         }
       ]
     }
   }
  end
end
