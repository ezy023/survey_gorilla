$(document).ready(function() {
  // This is called after the document has loaded in its entirety
  // This guarantees that any elements we bind to will exist on the page
  // when we try to bind to them

  // See: http://docs.jquery.com/Tutorials:Introducing_$(document).ready()
});
$(document).ready(function(){
  $('button#add_question').on("click",function(e){
    e.preventDefault();
    var questionData = $('form#question').serialize();
    $.post("/surveys/create",questionData,function(response){
      $('form#question').append('<p>'+response.question1+'</p>');
    });
  });

});
