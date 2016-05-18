$(document).on('page:change',function(){
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		$('.'+attribute).prop('disabled',false);
	});

	retrieveAllBooks();


	


	function retrieveAllBooks(){
		var baseUrl = window.location.href;
		$.ajax({
			method: 'get',
			url: baseUrl + "/mybooks",
			success: getBooks,
			error: function(){
				
			}
		});
	}

	function getBooks(response){
		response.books['on_sale'].forEach(function(item){
			$('.js-append-books').append(bookToHTML(item.title,item.author,item.cover,item.price));
		});	
		var filters = $('.js-book-filters').find('input[type="radio"]');
		filters.on('click',function(){
			$('.js-append-books').empty();
			var action = $(this).val();
			response.books[action].forEach(function(item){
				$('.js-append-books').append(bookToHTML(item.title,item.author,item.cover,item.price));
			});	
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