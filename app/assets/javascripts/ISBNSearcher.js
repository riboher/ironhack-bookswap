$(function(){

$('.js-create-book').on('submit',function(event){
	event.preventDefault();
	var isbn = $('.search-isbn').val();
	getBook(isbn);
});

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
		var isbn = $(xml).find('isbn').text();
		var cover = $(xml).find('imageurl').text();
		var publisher = $(xml).find('publisher').text();
		var pages = $(xml).find('pages').text();
		var totalPrice = 0;
		var totalItems = $(xml).find('results').text();
		$(xml).find('item').each(function(){
			var $items = $(this);
			var price = $items.find('price');
			if(!isNaN(price.text())) totalPrice += parseInt(price.text());
		});
		var totalPrice = Math.round(totalPrice/totalItems);
		generateForm(title,isbn,author,publisher,cover,totalPrice);
	}

	function generateForm(title,isbn,author,publisher,cover,totalPrice){
		var modal = $('.js-isbn-modal');
		modal.empty();
		modal.append("<h2>Is this the book you're looking for?");
		modal.append("<form method='post' class='js-book-insertion'></form>");
		var form = $('.js-book-insertion')
		form.append("<div class='book-cover-thumbnail'><img src='" + cover + "'/></div>");
		form.append("<input type='text' value='"+title+"' disabled>");
		form.append("<input type='text' value='"+author+"' disabled>");
		form.append("<input type='text' value='"+publisher+"' disabled>");
		form.append("<label for='price'>You'll obtain:</label>");
		form.append("<input type='text' name='price' value='"+totalPrice+" points' disabled>");
	}






});