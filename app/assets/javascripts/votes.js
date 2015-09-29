var votes;

$(document).ready(function(){

  $('.upvote-button').on('click', function(event){
    event.preventDefault();
    var button = $(this);
    votes(button, 1);
  });

  $('.downvote-button').on('click', function(event){
    event.preventDefault();
    var button = $(this);
    votes(button, -1);
  });

  $('.unvote-button').on('click', function(event){
    event.preventDefault();
    var button = $(this);
    votes(button, 0);
  });


});

votes = function(button, val) {
  $.ajax({
    method: 'POST',
    url: button.parent().attr('action'),
    dataType: 'json',
    data: {vote: {value: val}}
  })
  .success(function(data){
    var score = $(button.parent().parent().children('.score'));
    score.text(data);
  });
};
