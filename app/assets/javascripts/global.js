document.addEventListener("turbolinks:load", function() {

	$('img.pimg').each(function(){
		if (!this.complete) {
			$(this).css({"opacity":"0"});
	        $(this).load(function(){
	        	$(this).addClass("seen");
	        	$(this).css({"opacity":"1"});
	        });
	    } else {
	    	$(this).css({"opacity":"1"});
	    }
		
	});

	var notification = $('.global-notification').length

	if(notification) {
		$('.global-notification').delay(2000).slideUp(500, function(){
			$('.global-notification').remove;
		});
	}
});