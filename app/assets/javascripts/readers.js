$(document).on('page:change',function(){

	//USER LOGIN METHODS
	var accessButtons = document.getElementsByClassName('js-access-buttons');

	for (var i = 0; i < accessButtons.length; i++){
		accessButtons[i].onclick = function(e){
			if(e.target.getAttribute('data-session') != null){
				showLogForm(e.target.getAttribute('data-session'));
			}
		}
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
			attrClass.css('border-color','#119966');
		}else {
			attrClass.prop('disabled',true);
			attrClass.css('border-color','#ddd');
		}
	});

	//USER BOOKS FILTERING

	if(window.location.href.indexOf("readers") > -1) {
       retrieveAllBooks();
    }

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
		console.log(response)
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
			setMasonryLayout();
		});
	}

	function bookToHTML(title,author,cover,price){
		return '<div class="book">'+
					'<div class="front">'+
						'<section class="book-box">'+
							'<article class="book-thumbnail">'+
								'<img src='+cover+'>'+
							'</article>'+
							'<article class="book-inner-elements">'+
								'<h6 class="book-title">'+title+'</h6>'+
								'<p class="book-author">'+author+'</p>'+
							'</article>'+
							'<article>'+
								'<p  class="book-more-info"></p>'+
							'</article>'+
						'</section>'+
					'</div>'+
				'</div>';
	}
});