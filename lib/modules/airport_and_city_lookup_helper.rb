module AirportAndCityLookupHelper
  def airport_lookup
    {
      "aruba"         => "AUA",
      "barcelona"     => "BCN",
      "new-york-city" => "NYC",
      "reykjavik"     => "REK",
      "kyoto"         => "UKY",
      "los-angeles"   => "LAX",
      "london"        => "LON",
      "shanghai"      => "PVG",
      "sydney"        => "SYD"
    }
  end

  def city_lookup
    airport_lookup.invert
    #I love this method.
  end
end
