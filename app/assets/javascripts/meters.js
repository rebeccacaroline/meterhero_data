$(document).ready(function(){

  $('h2').hide();

  $('form').on("submit", function(event){
    event.preventDefault();
    city_name = $('#city').val();
    $('#city').val("");
    $.ajax({
      url: "/",
      data: {city: city_name}
    }).success(function(response){
      $('h2').hide();
      $('.city-name').text(city_name);
      iterateMeters(response['meters']);
      $('.container').append(buildSavingsTemplate(response["savings"]));
    }).fail(function(){
      $('h2').show();
    })
  });

  function buildSavingsTemplate(savingsInfo){
    $('.savings .water').text(savingsInfo['water']);
    $('.savings .gas').text(savingsInfo['gas']);
    $('.savings .electric').text(savingsInfo['electric']);
    $('.savings .total').text(savingsInfo['total']);
  };

  function iterateMeters(meters){
    var context = {meter_response: meters};
    var html = $('#meter-template').html();
    var templatingFunction = Handlebars.compile(html);
    $('.meter ol').append(templatingFunction(context));
  };
});