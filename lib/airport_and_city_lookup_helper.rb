module AirportAndCityLookupHelper
  def airport_lookup
    {
      "aruba"         => "AUA",
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
    city_lookup = airport_lookup.invert
    city_lookup["EWR"] = "new-york-city"
    city_lookup["LGA"] = "new-york-city"
    city_lookup["JFK"] = "new-york-city"
    city_lookup["LHR"] = "london"
    city_lookup
  end

  def airport_converter
    {
      "AUA"           => "AUA",
      "BCN"           => "BCN",
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
      "LON"           => "LHR",
      "LHR"           => "LHR",
      "PVG"           => "PVG",
      "SYD"           => "SYD"
    }
  end
end
