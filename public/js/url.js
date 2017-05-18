$(document).ready(function() {
	$('#url-form').submit(function(event) { //locate form id, event is an argumnent 
		event.preventDefault() //default sends HTTP request

		$.ajax({ 
			url: '/receive', //where does it go after clicking submit 
			method: 'post',
			data: {long_url: $('input[name="long_url"]').val()}, //locate the data, can do with id too
			dataType: 'json',
			success: function(data) { //on success, do something
				$('#t-index tbody').append("<tr>" +
					"<td class='content'>" + data.long_url + "</td>" +
					"<td class='short'>" + data.short_url + "</td>" +
					"<td class='short'>" + data.click_count + "</td>" +
					"</tr>"
					)
			}
		})

	})
})