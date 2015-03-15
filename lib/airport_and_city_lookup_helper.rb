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
    airport_lookup.invert
    #I love this method.
  end

  def airport_converter
    {
      "AUA"           => "AUA",
      "BCN"           => "BCN",
      "DEL"           => "DEL",
      "JFK"           => "NYC",
      "NYC"           => "NYC",
      "LGA"           => "NYC",
      "KEF"           => "KEF",
      "KIX"           => "KIX",
      "LAS"           => "LAS",
      "LAX"           => "LAX",
      "MUC"           => "MUC",
      "LON"           => "LON",
      "PVG"           => "PVG",
      "SYD"           => "SYD"
    }
  end
end
