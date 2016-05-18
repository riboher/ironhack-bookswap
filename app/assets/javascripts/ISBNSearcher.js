$(document).on('page:change',function(){

$('.js-create-book').on('submit',function(event){
	event.preventDefault();
	var isbn = $('.search-isbn').val();
	getBook(parseISBN(isbn));
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
		// var pages = $(xml).find('pages').text();
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
		$('#modal-1').attr('checked',true);
		var form = $('.js-new-book-form');
		form.find('.cover').attr('src',cover);
		form.find('.title').val(title);
		form.find('.author').val(author);
		form.find('.publisher').val(publisher);
		form.find('.year').val(year);
		form.find('.price').val(totalPrice + 'points');
		form.find('.isbn').val(isbn);
	}

	




});