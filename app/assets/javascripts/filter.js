$(".fa-filter").on("click", function() {
  $("#visible-filters").toggleClass( "trip-filters" );
});

$(".fa-filter").on("click", function() {
$("#visible-filters").toggleClass( "trip-filters" );
});

$(document).ready(function() {

  $("input:checkbox").change(function() {
    if ($("input:checked").length > 0) {
      var checkedCategories = $('input:checkbox:checked').map(function (index, element) {
      return element.getAttribute('id').replace('category_', '');
      });

      $("trips-table").empty();

      $.getJSON('/trips.json', { categories: checkedCategories.toArray() }, function(data) {
        data.forEach(function(trip){
          console.log("hi");
          // appendToTable(trip);
        });
      });
    } else {
      $.getJSON('/trips.json', function(data){
        data.forEach(function(trip) {
          console.log("empty");
        });
      });
    };
  });
});
