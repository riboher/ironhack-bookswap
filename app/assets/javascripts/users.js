$(document).on('page:change',function(){
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		$('.'+attribute).prop('disabled',false);
	});

	retrieveAllBooks();


	var filters = $('.js-book-filters').find('input[type="radio"]');
	filters.on('click',function(){
		$('.js-append-books').empty();
		var action = $(this).val();
		console.log(action);
	});


	function retrieveAllBooks(){
		var baseUrl = window.location.href;
		$.ajax({
			method: 'get',
			url: baseUrl + "/mybooks",
			success: getBooks,
			error: function(){
				var msg= "We didn't find any books with that request. Please try again later";
				flashNotice('error',msg);
			}
		});
	}

	function getBooks(response){
		Object.keys(response.books).forEach(function(key,index){
			console.log(response.books[key])
		});
	}

	function bookToHTML(title,author,cover,price){
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