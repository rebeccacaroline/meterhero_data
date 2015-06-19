$(document).ready(function(){

  $('h2').hide();

  $('form').on("submit", function(event){
    event.preventDefault();
    city_name = $('#city').val();
    $('#city').val("");// This clears the input field on submission so it looks a little better.
    $.ajax({
      url: "/",
      data: {city: city_name}
    }).success(function(response){
      $('h2').hide();//The reason the h2 is hidden twice is because I wanted it to hide itself if a user inputs a right city after having input a wrong city.
      $('.city-name').text(city_name);
      $('.meter ol').empty(); //this makes it so that if a user inputs more than one city, the meter information gets replaced instead of appended to
      iterateMeters(response['meters']); //this function was separated out to make the code a bit more readable
      $('.container').append(buildSavingsTemplate(response["savings"]));
    }).fail(function(){
      $('h2').show();
    })
  });

  function buildSavingsTemplate(savingsInfo){
    $('.savings .water').text("$"+savingsInfo['water']);
    $('.savings .gas').text("$"+savingsInfo['gas']);
    $('.savings .electric').text("$"+savingsInfo['electric']);
    $('.savings .total').text("$"+savingsInfo['total']);
  };

  function iterateMeters(meters){
    var context = {meter_response: meters};
    var html = $('#meter-template').html();
    var templatingFunction = Handlebars.compile(html);
    $('.meter ol').append(templatingFunction(context));
  };
});