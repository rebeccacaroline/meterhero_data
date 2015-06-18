$(document).ready(function(){
  $('form').on("submit", function(event){
    event.preventDefault();
    city_name = $('#city').val();
    $('#city').val("");
    $.ajax({
      url: "/",
      data: {city: city_name}
    }).success(function(response){
      $('.container').append(buildMeterTemplate(response["meter"]))
      $('.container').append(buildSavingsTemplate(response["savings"]))

    }).fail(function(){
      console.log("You Fail!")
    })
  });

  function buildMeterTemplate(meterInfo){

  };

  function buildSavingsTemplate(savingsInfo){

  }
});