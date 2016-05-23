$(document).on('page:change',function(){

	setMasonryLayout();

	function getBookHeights(){
		var frontCards = document.querySelectorAll('.front > .book-box');
		var backCards = document.querySelectorAll('.back > .book-box');
		for (var i = 0; i < frontCards.length; i++){
			setBookHeight(backCards[i],frontCards[i].clientHeight);
		}
	}

	function setBookHeight(element,height){
		element.style.height = height + "px";
	}

	$('.js-create-book').on('submit',function(event){
		event.preventDefault();
		var isbn = $('.search-isbn').val();
		getBook(parseISBN(isbn));
		$('.sk-folding-cube').toggleClass('hidden');
	});

	function parseISBN(isbn) {
		return isbn.split("-").join("");
	}

	var ENDPOINT = "http://www.directtextbook.com/xml.php?key=4cf4a7b1a265e7a0710c24a1d4d72df4&isbn=";
	
	function getBook(isbn){
		$.ajax({
			type: 'GET',
			url: ENDPOINT + isbn,
			dataType: 'xml',
			success: parseXML,
			error: function(){
				console.log("Something went really bad");
			}
		});
	}

	function parseXML(xml){
		var title = $(xml).find('title').text();
		var author = $(xml).find('author').text();
		var year = $(xml).find('publicationdate').text();
		var isbn = $(xml).find('ean').text();
		var cover = $(xml).find('imageurl').text();
		var publisher = $(xml).find('publisher').text();
		var totalPrice = 0;
		var totalItems = $(xml).find('results').text();
		$(xml).find('item').each(function(){
			var $items = $(this);
			var price = $items.find('price');
			if(!isNaN(price.text())) totalPrice += parseInt(price.text());
		});
		var totalPrice = Math.round(totalPrice/totalItems);
		generateForm(title,isbn,author,year,publisher,cover,totalPrice);
	}

	function generateForm(title,isbn,author,year,publisher,cover,totalPrice){
		$('.sk-folding-cube').toggleClass('hidden');
		$("#modal-book.modal-state").prop("checked", true);
		var form = $('.js-new-book-form');
		form.find('.cover').attr('src',cover);
		form.find('.title').val(title);
		form.find('.author').val(author);
		form.find('.publisher').val(publisher);
		form.find('.year').val(year);
		form.find('.price').val(totalPrice + 'points');
		form.find('.isbn').val(isbn);
	}

	//BOOK CREATION FROM FORM
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
				var msg = "Your book has been succesfully created";
				triggerResult('success',msg);
				
			},
			error: function(){
				var msg = "Ups! Something went wrong. The book was not saved";
				triggerResult('error',msg);
			},
		});
	}

	function triggerResult(notice,msg){
		$('.search-isbn').val("");
		$(".js-create-book").toggleClass('show-menu');
		$('#modal-1').attr('checked',false);
		flashNotice(notice,msg);
	}

    $('.row').on('click','.book',function(event){
    	var bookId = event.currentTarget.id;
    	var self = this;
    	getBookHeights();
    	getBookLocation(bookId).bind(self);
    	$(self).data('swapped',bookId);
    	setTimeout(function(){
    		$(self).find('.book-price').toggleClass('hidden');
    	},150);
    });


    function getBookLocation(bookId){
    	var APIKEY = "key=AIzaSyAJwQ7qgwUYg9YyNhWHAWiiqBKRWJXaqGQ";
    	var ENDPOINT = "https://maps.googleapis.com/maps/api/geocode/json?"

    	var book = document.getElementById(bookId)
    	var postcode = book.querySelector('.postcode').value;
    	var address = book.querySelector('.address').value;
    	var city = book.querySelector('.city').value;
    	console.log(this);
		$.ajax({
			url: ENDPOINT + "address=" + address + postcode + city + "&region=es&" + APIKEY,
			dataType: 'json',
			success: getCoordinates,
			error: function(){
				console.log("No position was retrieved");
			}
		});
    }

    function getCoordinates(response){
    	var lat = response.results[0].geometry.location.lat;
    	var lng = response.results[0].geometry.location.lng;
    	printMap(lat,lng)
    	console.log(this);
    }

    function printMap(latitude,longitude){

    }
});