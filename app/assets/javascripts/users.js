$(document).on('page:change',function(){

	//USER LOGIN METHODS

	var signInButton = $('.sign');
	var logInButton = $('.log');

	signInButton.on('click',function(){
		showLogForm('signup');
		console.log("HOLA")
	});

	logInButton.on('click',function(){
		showLogForm('login');
		console.log("HOLA")
	});

	function showLogForm(method){
		$('.js-' + method + '-form').find('#modal-1').prop('checked',true);
	}

	//USER INFO EDITION

	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		if ($('.' + attribute).prop('disabled')){
			$('.' + attribute).prop('disabled',false);
		}else {
			$('.' + attribute).prop('disabled',true);
		}
	});

	//USER BOOKS FILTERING

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
		return '<div class="book">'+
					'<div class="front">'+
						'<section class="book-box">'+
							'<article class="book-box-actions">'+
								'<a href="#" class="book-price">'+price+'<i class="fa fa-book"></i></a>'+
							'</article>'+
							'<article class="book-thumbnail">'+
								'<img src='+cover+'>'+
							'</article>'+
							'<article class="book-inner-elements">'+
								'<h6 class="book-title">'+title+'</h6>'+
								'<p class="book-author">'+author+'</p>'+
							'</article>'+
						'</section>'+
					'</div>'+
				'</div>';
	}
});