$(document).ready(function() {
	$('#butr1d1').click(function(){
		var status;
		if($('#butr1d1').val() =="off"){
			$('#imgr1d1').attr('src','bulbon.png');
			$('#butr1d1').val("on");
			$('#butr1d1').text("OFF");
			status=1;
		}
		else if($('#butr1d1').val()=='on') {
			$('#imgr1d1').attr('src','bulboff.png');
			$('#butr1d1').val("off");
			$('#butr1d1').text("ON");
			status=0

		}
		$.get('room1.php', {device1:status},function(data){});

	});

	$('#butr2d2').click(function(){
		var status;
		if($('#butr2d2').val() =="off"){
			$('#imgr2d2').attr('src','bulbon.png');
			$('#butr2d2').val("on");
			$('#butr2d2').text("OFF");
			status=1;
		}
		else if($('#butr2d2').val()=='on') {
			$('#imgr2d2').attr('src','bulboff.png');
			$('#butr2d2').val("off");
			$('#butr2d2').text("ON");
			status=0

		}
		$.get('room2.php', {device2:status},function(data){});

	});

	$('#butMois').click(function(){
		jQuery.get('mois.txt',function(data){
			$('#dataMois').text(data+'%');
		});
	});
	$('#butTemp').click(function(){
		jQuery.get('temp.txt',function(data){
			$('#dataTemp').text(data+'C');
		});
	});

});