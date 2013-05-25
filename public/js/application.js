$(document).ready(function(){
  $('button#add_question').on("click",function(e){
    e.preventDefault();
    $.post('/surveys/add_question', function(data){
      console.log(data);
      $('#survey_form tr:last').after(data);
    });
    
  });

});
