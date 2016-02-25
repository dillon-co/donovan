$(function(){
  $("#money_backed").change(function(){
    $('.stripe-button').attr('data-amount') = $(this).val
  })
})
