// This is a manifest file that'll be compiled into application.js, which will include all the files
// listed below.
//
// Any JavaScript/Coffee file within this directory, lib/assets/javascripts, vendor/assets/javascripts,
// or any plugin's vendor/assets/javascripts directory can be referenced here using a relative path.
//
// It's not advisable to add code directly here, but if you do, it'll appear at the bottom of the
// compiled file.
//
// Read Sprockets README (https://github.com/rails/sprockets#sprockets-directives) for details
// about supported directives.
//
//= require jquery
//= require jquery_ujs
//= require foundation
//= require_tree .

$(function(){ $(document).foundation(); });

$(document).ready(function(){

  $('.upvote-button').on('click', function(event){
    event.preventDefault()
    var button = $(this);
    votes(button, 1)
  });

  $('.downvote-button').on('click', function(event){
    event.preventDefault()
    var button = $(this);
    votes(button, -1)
  });

  $('.unvote-button').on('click', function(event){
    event.preventDefault()
    var button = $(this);
    votes(button, 0)
  });


});

var votes = function(button, val) { // Function accepts the form input
  $.ajax({ // variable set to AJAX function
    method: "POST", // Method for POSTing input data
    url: button.parent().attr("action"), // URL matches POST in server.rb
    dataType: "json", // data uses params objects from server.rb file
    data: {value: val}
  })
  .success(function(data){
    score = $(button.parent().parent().children('.score'))
    score.text(data)
  });
};
