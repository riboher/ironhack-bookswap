$(document).on('page:change',function(){
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		$('.'+attribute).prop('disabled',false);
	});

	var filters = $('.js-book-filters').find('input[type="radio"]');
	filters.on('click',function(){
		$('.js-append-books').empty();
		var action = $(this).val();
		callBooks(action);
	});


	function callBooks(action){
		var baseUrl = window.location.href;
		$.ajax({
			method: 'get',
			url: baseUrl + "/" + action,
			success: getBooks,
			error: function(){
				var msg= "We didn't find any books with that request. Please try again later";
				flashNotice('error',msg);
			}
		});
	}

	function getBooks(books){
		books.forEach(function(book){
			var book = parseBook(book.title,book.author,book.cover,book.price);
			$('.js-append-books').append(book);
		});
	}

	function parseBook(title,author,cover,price) {
		return '<div class="item">'+
					'<section class="item-box">'+
						'<article class="item-box-actions">'+
							'<a href="#" class="item-price">'+price+'<i class="fa fa-connectdevelop"></i></a>'+
						'</article>'+
						'<article class="item-thumbnail">'+
							'<img src='+cover+'>'+
						'</article>'+
						'<article class="item-inner-elements">'+
							'<h6 class="item-title">'+title+'</h6>'+
							'<p class="item-author">'+author+'</p>'+
						'</article>'+
					'</section>'+
				'</div>';
	}
});