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


	var form = document.getElementById('typeahead-search-form');
	form.addEventListener('submit',function(e){
		e.preventDefault();
		var query = this.getElementsByClassName('tt-input')[0].value;
		var book = query.split("-")[0];

		$.ajax({
			method: 'get',
			url: '/book_search?title=' + book,
			success: getBook,
			error: function(){
				console.log('Something went bad');
			}
		});
	});

	function getBook(book){
		var container = document.getElementsByClassName('row')[0];
		while(container.firstChild){
			container.removeChild(container.firstChild);
		}
		container.innerHTML = book;
		$(".book").flip({
		  	trigger: 'click',
		  	forceHeight: true
		});
	}
});

