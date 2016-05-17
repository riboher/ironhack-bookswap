$(function(){
	$('.js-new-book-form').on('submit',function(event){
		event.preventDefault();
		var title = $(this).find('.title').val();
		var author = $(this).find('.author').val();
		var publisher = $(this).find('.publisher').val();
		var cover = $(this).find('.cover').attr('src');
		var isbn = $(this).find('.isbn').val();
		var description = $(this).find('.description').val();
		var price = parseInt($(this).find('.price').val());
		addBook(title,author,publisher,cover,isbn,description,price);
	});


	function addBook(title,author,publisher,cover,isbn,description,price) {
		$.ajax({
			method: 'POST',
			url: '/books/new',
			data: title + author + publisher + cover + isbn + description + price,
			success: function(){
				console.log("The book was created successfully");
			}
		});
	}
});