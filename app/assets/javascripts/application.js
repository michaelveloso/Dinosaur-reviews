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
    event.preventDefault();
    var button = this;
    upvotes(button);
  });

  $('.downvote-button').on('click', function(event){
    event.preventDefault();
    var button = this;
    downvotes(button);
  });

});



var upvotes = function(button) { // Function accepts the form input
  $.ajax({ // variable set to AJAX function
    method: "PUT", // Method for POSTing input data
    url: $(button).parent().attr("action"), // URL matches POST in server.rb
    dataType: "json" // data uses params objects from server.rb file
  })
  .done(function(data){
    $('#total-votes p')[0].innerHTML = parseInt($('#total-votes p')[0].innerHTML) + 1
    // button.innerHTML = "Upvote " + data
  });
};

var downvotes = function(button) { // Function accepts the form input
  $.ajax({ // variable set to AJAX function
    method: "PUT", // Method for POSTing input data
    url: $(button).parent().attr("action"), // URL matches POST in server.rb
    dataType: "json" // data uses params objects from server.rb file
  })
  .done(function(data){
    button.innerHTML = "Downvote " + data
  });
};
