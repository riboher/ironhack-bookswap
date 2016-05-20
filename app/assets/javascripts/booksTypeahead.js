$(document).on('page:change',function(){
	var books = new Bloodhound({
		datumTokenizer: Bloodhound.tokenizers.obj.whitespace('title'),
		queryTokenizer: Bloodhound.tokenizers.whitespace,
		remote: {
		    url: '/book_query/?query=%QUERY',
		    wildcard: '%QUERY'
		  }
	});

	books.initialize();

	$('#books').typeahead({
		hint: true,
		highlight: true,
		minlength: 2
	}, {
		name: 'books',
		displayKey: function(item){
			return item.title + " - " + item.author
		},
		source: books.ttAdapter()
	});
});