$(document).ready(function() {
	$(document).find('#groups').toggle();
	
	$('#index-item-information').bind('click', function(event){
		$(document).find('#news').toggle();
		$(document).find('#groups').toggle();
	});
		
});
