function rsvpEvent(rsvp) {
	$.ajax( {
		type :"GET",
		url :"result.jsp",
		data :"rsvp=" + rsvp ,
		success : function() {
			alert('rsvp: ' + rsvp );
		},
		error : function() {
			alert('rsvp: ' + rsvp );
		}
	});
}