$(function () {
  setTimeout(function () {
    $('.alert').fadeOut('fast');
  }, 3000);
})
$('#myModal').on('shown.bs.modal', function () {
  $('#myInput').focus()
})
$('#save').on('click', function () {
  $('#value').text($('#newGoal').val());
});
