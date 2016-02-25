$(function(){
  var filled_amount = $('.funded-status').attr('data-amount');
  var empty_amount = $('.empty-status').attr('data-amount');
  var goal = $('.funded-status').attr('data-goal');

  function rangeMapper(value, from_min, from_max, to_min, to_max){
    return ((to_max - to_min) * (Number(value) - from_min)) / (Number(from_max) - from_min) + to_min;
  }

  var filled_amount_size = rangeMapper(filled_amount, 0, goal, 10, 250);
  var empty_amount_size = rangeMapper(empty_amount, 0, goal, 0, 250);

  $('.funded-status').css("min-height", filled_amount_size.toString()+'px');
  $('.empty-status').css("min-height", empty_amount_size.toString()+'px');
});
