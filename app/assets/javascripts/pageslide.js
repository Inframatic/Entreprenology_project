
$(document).ready(function() {
  $(".slider_head").click(function() {
    $(this).siblings(".panel").slideToggle("fast");
  });
  $('#friendlycircle').click(function() {
    $('aside').toggle("slide");
    $('#friendlycircle').rotate(180);
  });
});
