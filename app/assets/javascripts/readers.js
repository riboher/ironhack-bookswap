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
	//FORMS EDITION
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
	
	setTimeout(function(){
		$('.flash-notice, .flash-container').css('display','none');
	},2500);

	$('#js-close-purchase').on('click',function(){
		$('.flash-notice').remove();
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
		setMasonryLayout();
		if(response.books['on_sale'].length == 0){
			$('.banner').removeClass('hidden');
		}else{
			response.books['on_sale'].forEach(function(item){
				$('.js-append-books').append(bookToHTML(item.book.book_details.id,
														item.book.book_details.title,
														item.book.book_details.author,
														item.book.book_details.cover,
														item.book.book_details.price,
														item.book.avatar_path));
			});	
		}

		var filters = $('.js-book-filters').find('input[type="radio"]');
		filters.on('click',function(){
			$('.js-append-books').empty();
			var action = $(this).val();
			if (action == 'on_sale' && response.books['on_sale'].length == 0){
				$('.banner').removeClass('hidden');
			}else{
				$('.banner').addClass('hidden');
			}
			response.books[action].forEach(function(item){
				if(action == 'bought') {
					$('.js-append-books').append(bookToHTML(item.book.book_details.id,
														item.book.book_details.title,
														item.book.book_details.author,
														item.book.book_details.cover,
														item.book.book_details.price,
														item.book.avatar_path,
														'Reswap!'));
				}else {
					$('.js-append-books').append(bookToHTML(item.book.book_details.id,
														item.book.book_details.title,
														item.book.book_details.author,
														item.book.book_details.cover,
														item.book.book_details.price,
														item.book.avatar_path));
				}
				
			});	
		});
	}

	function bookToHTML(id,title,author,cover,price,avatar,action){
		action = action || "";
		return '<div class="book" id="'+ id +'">'+
					'<div class="front">'+
						'<section class="book-box">'+
							'<article class="book-thumbnail">'+
								'<img src="'+setCover(cover,avatar)+'">'+
							'</article>'+
							'<article class="book-inner-elements">'+
								'<h6 class="book-title">'+title+'</h6>'+
								'<p class="book-author">'+author+'</p>'+
							'</article>'+
							'<article>'+
								'<p class="book-more-info">'+
									createActionLink(id,action) + 
								'</p>'+
							'</article>'+
						'</section>'+
					'</div>'+
				'</div>';
	}

	function createActionLink(id,action){
		if(action != ""){
			return "<a href='/books/"+id+"/reswap'>"+action+"</a>";
		}else{
			return "";
		}
	}

	function setCover(cover,avatar){
		if(avatar.indexOf('missing') > 0){
			return cover;
		}else{
			return avatar;
		}
	}
});