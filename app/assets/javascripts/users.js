$(document).on('page:change',function(){

	//USER LOGIN METHODS

	var logButton = document.getElementsByClassName('js-access-button');

	for (var i = 0; i < logButton.length; i++){
		logButton[i].addEventListener('click',function(){
			showLogForm(this.getAttribute('data-session'));
		});
	}

	function showLogForm(method){
		$('.js-' + method + '-form').find('#modal-1').prop('checked',true);
	}
	//FORM EDITION
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('edit');
		var attrClass = $('.' + attribute);
		if (attrClass.prop('disabled') && attribute != 'price'){
			attrClass.prop('disabled',false);
			attrClass.css('color','#119966');
		}else {
			attrClass.prop('disabled',true);
			attrClass.css('color','#4C5454');
		}
	});

	//USER BOOKS FILTERING

	retrieveAllBooks();

	function retrieveAllBooks(){
		var baseUrl = window.location.href;
		$.ajax({
			method: 'get',
			url: baseUrl + "/my_books",
			dataType: 'json',
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