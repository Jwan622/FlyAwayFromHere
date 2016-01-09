module AirportAndCityLookupHelper
  def airport_lookup
    # the airport_lookup hash is used to clean the arguments from the new_planner
    # page so that an api call to the qpx search can be made.
    {
      "aruba"         => "AUA",
      "boston"        => "BOS",
      "barcelona"     => "BCN",
      "delhi"         => "DEL",
      "new-york-city" => "NYC",
      "reykjavik"     => "KEF",
      "kyoto"         => "KIX",
      "las-vegas"     => "LAS",
      "los-angeles"   => "LAX",
      "munich"        => "MUC",
      "london"        => "LON",
      "shanghai"      => "PVG",
      "sydney"        => "SYD"
    }
  end

  def city_lookup
    {
      "AUA" => "aruba",
      "BOS" => "boston",
      "BCN" => "barcelona",
      "DEL" => "delhi",
      "EWR" => "new-york-city",
      "JFK" => "new-york-city",
      "KEF" => "reykjavik",
      "KIX" => "kyoto",
      "LAS" => "las-vegas",
      "LAX" => "los-angeles",
      "LHR" => "london",
      "LGA" => "new-york-city",
      "LGW" => "london",
      "LON" => "london",
      "MUC" => "munich",
      "NYC" => "new-york-city",
      "PVG" => "shanghai",
      "SYD" => "sydney"
    }
  end

  # the airport_converter is used to look up trip_info seed data using the airport
  # code returned from the google qpx api.
  def airport_converter
    {
      "AUA"           => "AUA",
      "BCN"           => "BCN",
      "BOS"           => "BOS",
      "DEL"           => "DEL",
      "JFK"           => "NYC",
      "NYC"           => "NYC",
      "EWR"           => "NYC",
      "LGA"           => "NYC",
      "KEF"           => "KEF",
      "KIX"           => "KIX",
      "LAS"           => "LAS",
      "LAX"           => "LAX",
      "MUC"           => "MUC",
      "LON"           => "LON",
      "LHR"           => "LON",
      "LGW"           => "LON",
      "PVG"           => "PVG",
      "SYD"           => "SYD"
    }
  end
end
