$(document).ready(function() {
	// Este código corre después de que `document` fue cargado(loaded) 
	// completamente. 
	// Esto garantiza que si amarramos(bind) una función a un elemento 
	// de HTML este exista ya en la página. 



  $("#enviar").on("click", function(){

    document.getElementById("soyform").submit();

  });

  $("#qpvote").on("click", function(){

    var question_id = $("#questionid").text();
    var qvotes = Number($("#userp").text());
    qvotes += 1;
    $("#userp").text(qvotes);
    var string_vote = "vote=" + qvotes.toString() + "&question=" + question_id;
    // var question_vote = "question=" + qvotes.toString();
    // console.log(typeof string_vote)
    // console.log(question_id)

    $.post( "/question/vote", string_vote, function(data) {
      // console.log(data)
    });

  });

  $("#qnvote").on("click", function(){

    var question_id = $("#questionid").text();
    var qvotes = Number($("#userp").text());
    qvotes -= 1;
    $("#userp").text(qvotes);
    var string_vote = "vote=" + qvotes.toString() + "&question=" + question_id;
    // console.log(string_vote)

    $.post( "/question/vote", string_vote, function(data) {
      // console.log(data)
    });

  });

  $(".clickp").on("click", function(){

    var respuesta = $(this).attr("respuestaid");
    var votes = Number($("#valuev" + respuesta).text())
      votes += 1;
    $("#valuev" + respuesta).text(votes);
    var string_vote = "vote=" + votes.toString() + "&answer=" + respuesta;
   
    $.post( "/answer/vote", string_vote, function(data) {
      // console.log(data)
    }); 

  });

    $(".clickn").on("click", function(){

    var respuesta = $(this).attr("respuestaid");
    var votes = Number($("#valuev" + respuesta).text())
      votes -= 1;
    $("#valuev" + respuesta).text(votes);
    var string_vote = "vote=" + votes.toString() + "&answer=" + respuesta;
   
    $.post( "/answer/vote", string_vote, function(data) {
      // console.log(data)
    }); 
    
  });

  });


