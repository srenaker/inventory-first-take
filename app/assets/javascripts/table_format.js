$(document).ready(function(){
	$(".item_list").tablesorter({sortList: [[1,0]], widgets: ['zebra']});

	$('.item_details').hide();

	$('tbody tr[data-load]').click( function() { 
		var path = $(this).attr('data-load');
        $(".item_details").load(path).show();
		$("*").removeClass('selected_item');
		$(this).addClass('selected_item');
    });

    
});

function hide_details() {
	$(".item_details").hide();
	$("*").removeClass('selected_item');
}

