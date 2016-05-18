$(document).on('page:change',function(){
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		$('.'+attribute).prop('disabled',false);
	});

	var filters = $('.js-book-filters').find('input[type="radio"]');
	filters.on('click',function(){
		var action = $(this).val();
		var baseUrl = window.location.href;
		$.ajax({
			method: 'get',
			url: baseUrl + "/" + action,
			success: getBooks,
			error: function(){
				var msg= "We didn't find any books with that request. Please try later";
				flashNotice('error',msg);
			}
		});
	});

	function getBooks(books){
		console.log(books);
	}
});