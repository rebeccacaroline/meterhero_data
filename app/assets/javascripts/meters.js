$(document).ready(function(){
  $('form').on("submit", function(event){
    event.preventDefault();
    city_name = $('#city').val();
    $('#city').val("");
    $.ajax({
      url: "/",
      data: {city: city_name}
    }).success(function(response){
      iterateMeters(response['meters']);
      $('.container').append(buildSavingsTemplate(response["savings"]));
    }).fail(function(){
      $('.container').prepend("<h2>That city could not be found</h2>")
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