$(function(){
  // Add the form to the page with AJAX
  // Select the new-contact link and bind click event
  $('#new-contact').click(function(event){
    // Stop the browser from following the link
    event.preventDefault();

    // Hide the link
    $(this).hide();

    // store the href of the link
    var url = $(this).attr('href');

    // request the contact form
    $.get(url, function(serverResponse, status, request){
      //add the contact form to the page
      $('.container').append(serverResponse);
    });
  });

});