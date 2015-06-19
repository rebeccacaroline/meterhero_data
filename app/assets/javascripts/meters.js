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
      $('.container').append(buildSavingsTemplate(response["savings"]))

    }).fail(function(){
      $('.container').append("<h2>That city could not be found</h2>")
    })
  });

  function buildMeterTemplate(meterInfo){
    $('.meters ul li').text(meterInfo);
  };

  function buildSavingsTemplate(savingsInfo){
    $('.savings .water').text(savingsInfo['water']);
    $('.savings .gas').text(savingsInfo['gas']);
    $('.savings .electric').text(savingsInfo['electric']);
    $('.savings .total').text(savingsInfo['total']);
  };

  function iterateMeters(meters){
    console.log(meters);
    for (i = 0; i < meters.length; i++ ) {
      console.log(meters[i])
      $('.container').append(buildMeterTemplate(meters[i]));
    };
  };
});