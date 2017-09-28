var init_stock_lookup;

init_stock_lookup = function() {
  $('#stock-lookup-form').on('ajax:success',function(event, data, status,xhr){
    $('#stock-lookup').replaceWith(data);
    init_stock_lookup();
  });

  $('#stock-lookup-form').on('ajax:before',function(event, data, status){
    show_spinner();
  });

  $('#stock-lookup-form').on('ajax:after',function(event, data, status, xhr){
    hide_spinner();
  });

  $('#stock-lookup-form').on('ajax:error',function(event, xhr, status, data, error){
    hide_spinner();
    $('#stock-lookup-results').replaceWith(' ');
    $('#stock-lookup-errors').replaceWith('Stock not found');
  });
}

$(document).ready(function () {
  init_stock_lookup();
})
