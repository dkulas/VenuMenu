// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
//= require jquery
//= require jquery_ujs
//= require turbolinks
//= require_tree .


$(document).ready(function(){
// http://songkick.com
  //2. when the user submits a form
  $(".search").on("submit", function( event ){
    event.preventDefault(); 
    // get the user input and save it
    var input = $("#venue-search").val();
    var apikey = "UuzY21WjoBgBxDEK";
    var url = "http://api.songkick.com/api/3.0/search/venues.json?query=" + input + "&apikey=" + apikey + "&jsoncallback=?";
    // ask the api for data
    $.ajax({
      url: url,
      dataType: "jsonp",
      method: "GET",
      success: function(response){
        // console.log(response);
        displayResults(response, input);
      },
    });
    this.reset();
  });
});
function displayResults( response, input ){
  $(".venue-results").empty();
  $(".content").empty();
  var apikey = "UuzY21WjoBgBxDEK";
  $.getJSON("http://api.songkick.com/api/3.0/search/venues.json?query=" + input + "&apikey=" + apikey + "&jsoncallback=?", function(data){
  var venues = data['resultsPage']['results']['venue'];
  var results = $(".content").append($("<ul></ul>").addClass("results-list"));
  for (var i=0; i < venues.length; i++) {
    var displayName = venues[i]['displayName'];
    var website = venues[i]['website'];
    var city = venues[i]['city']['uri', 'displayName'];
    var state = venues[i]['metroArea']['state']['displayName'];
    var street = venues[i]['metroArea', 'street'];
    var metroArea = venues[i]['metroArea', 'phone'];
    var venueHeader = displayName + " (" + city + ", " + state + ")";

    var resultContainer = $("<div class='venue-results'></div>");
    resultContainer.append($("<h2></h2>").addClass("displayName").html(venueHeader));
    resultContainer.append($("<p></p>").addClass("street").html(street));
    resultContainer.append($("<p></p>").addClass("metroArea").html(metroArea));
    resultContainer.append($("<a target='_blank'></a>").addClass("website").attr('href', website).html(website));

    $(".results-list").append(resultContainer);
 }
});
}
//___________________________________________________________________________
