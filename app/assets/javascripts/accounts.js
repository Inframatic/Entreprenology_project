// # Place all the behaviors and hooks related to the matching controller here.
// # All this logic will automatically be available in application.js.
// # You can use CoffeeScript in this file: http://coffeescript.org/

$(document).ready(function() {
	$(".account-button").on("click", function() {
		if (($(this).attr("name")) == "startup-button")
			{$.ajax({
				type: "GET",
				url: "/startups/new"
			});
			} else if (($(this).attr("name")) == "intern-button")
					{$.ajax({
					type: "GET",
					url: "/intern/new"
					});
			};
	});
});
