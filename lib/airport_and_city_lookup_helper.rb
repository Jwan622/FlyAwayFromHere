module AirportAndCityLookupHelper
  def airport_lookup
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
      "london"        => "LCY",
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
      "MUC" => "munich",
      "NYC" => "new-york-city",
      "LON" => "london",
      "PVG" => "shanghai",
      "SYD" => "sydney"
    }
  end

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
      "LON"           => "LHR",
      "LHR"           => "LHR",
      "PVG"           => "PVG",
      "SYD"           => "SYD"
    }
  end
end
