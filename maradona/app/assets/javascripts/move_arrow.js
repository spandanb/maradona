$(document).ready(function() {
	
	var arrow = $('#arrow-left');
	var arrow2 = $('#arrow-left2');
	
	$('.left-nav-item').bind('hover', function(event){
		switch(this.id){
			case "index-item-activity":
				arrow.css("top", -481);
				arrow2.css("top", -501);
				break;
			case "index-item-information":
				arrow.css("top", -432);
				arrow2.css("top", -452);
				break;
			case "index-item-campus-connect":
				arrow.css("top", -379);
				arrow2.css("top", -399);
				break;
			case "index-item-mentions":
				arrow.css("top", -324);
				arrow2.css("top", -344);
				break;
			case "index-item-subscriptions":
				arrow.css("top", -266);
				arrow2.css("top", -286);
				break;
			case "index-item-peers":
				arrow.css("top", -216);
				arrow2.css("top", -236);
				break;
			case "index-item-groups":
				arrow.css("top", -163);
				arrow2.css("top", -183);
				break;
			case "index-item-my-events":
				arrow.css("top", -107);
				arrow2.css("top", -127);
				break;
			case "index-item-photos-and-files":
				arrow.css("top", -54);
				arrow2.css("top", -74);
				break;
			default:
				break;
		}
		
	});
		


});
