$(function(){
	$('.js-new-book-form').on('submit',function(event){
		event.preventDefault();
		var data  = {
			book: {}
		}
		data.book.title = $(this).find('.title').val();
		data.book.author = $(this).find('.author').val();
		data.book.publisher = $(this).find('.publisher').val();
		data.book.year = $(this).find('.year').val();
		data.book.cover = $(this).find('.cover').attr('src');
		data.book.isbn = $(this).find('.isbn').val();
		data.book.description = $(this).find('.description').val();
		data.book.price = parseInt($(this).find('.price').val());
		addBook(data);
	});


	function addBook(data) {
		$.ajax({
			method: 'POST',
			url: '/books/create',
			data: data,
			success: function(){
				var msg = "Your book has been succesffully created";
				$('#modal-1').attr('checked',false);
				flashNotice('success',msg);
			},
			error: function(){
				var msg = "Ups! Something went wrong. The book was not saved";
				$('#modal-1').attr('checked',false);
				flashNotice('error',msg);
			},
		});
	}
});