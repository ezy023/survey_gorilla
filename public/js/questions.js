$(document).ready(function(){
  ('button#add_question').on("click",function(e){
    e.preventDefault();
    var questionData = ('form#question').serialize();
    $.post("/surveys/create",questionData,function(response){
      $('form#add_question').append(response);
    });
  });

});
