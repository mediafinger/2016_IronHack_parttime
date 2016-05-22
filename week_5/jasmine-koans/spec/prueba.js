$( document ).ready(function() {
    $("#submit").on('click', function(param1){
		console.log(param1);
		var targetBox = $("#result");
		var sourceText = $("#username").val();
		var reversedText = sourceText.split("").reverse().join("");
		targetBox.val(reversedText);
	});
	var originalSize = $("#username").css("font-size");
	$("#username").on('mouseover', function(){
		console.log("hi");
		$(this).css("font-size", "200%");
	});
	
	$("#username").on('mouseleave', function(){
		console.log("bye");
		$(this).css("font-size",originalSize)
	});
	// $("#username").on('keyup', function(){
	// 	var text = $(this).val();
	// 	if (text.length > 10) {
	// 		$("#otherBox").css("background","red");
	// 	} else if (text.length > 5) {
	// 		$("#otherBox").css("background","yellow");
	// 	} else {
	// 		$("#otherBox").css("background","")
	// 	}
	// });


// ejercicio chungo
	// $("#username").on('keyup', changeBox);

	// function changeBox(){
	// 	renderWhenReady(function(color){
	// 		$("#otherBox").css("background",color)
	// 	});
	// }

	// function renderWhenReady(renderCallback){
	// 	setTimeout(function(){
	// 		// var currentTime = new Date().toLocaleString();
	// 		renderCallback("orange");
	// 	}, 1000);
	// }
	// }function changeBox(){
	// 	var text = $(this).val();
	// 	render(text.length, function(color){
	// 		$("otherBox").css("background", color)
	// 	});
	// }

	// function render(number, whatToDoNext){
	// 	setTimeout(function(){
	// 		whatToDoNext("orange");
	// 	}, 4000);
	// }


	$("#submit").on('click', changeBox);

	function changeBox(){
		renderWhenReady(function(color){
			$("#otherBox").css("background",color)
		});
	}
	function renderWhenReady(renderCallback){
		console.log('rendering');
		$.get('http://swapi.co/api/people/1', function(data) {
			$('#otherBox').append("<ul></ul>");
			var outputData = [data.name, data.gender, data.eye_color]
			var i = 0
			for (i ; i < outputData.length; i++) {
				$('#otherBox ul').append("<li>" + outputData[i] + "</li>")
			};
			renderCallback('orange');
		});			
	}
});













