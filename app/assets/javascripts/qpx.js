var ajaxCall = function() {
  $.ajax({
   type: "POST",
   url: "https://www.googleapis.com/qpxExpress/v1/trips/search?key=#{ENV[qpx_twitter_key]}",
   contentType: 'application/json',
   dataType: 'json',
   data: JSON.stringify(FlightRequest),
   success: function (data) {
    console.log(JSON.stringify(data));
  },
    error: function(){
     alert("Access to Google QPX Failed You DummyHead.");
   }
  });
};
