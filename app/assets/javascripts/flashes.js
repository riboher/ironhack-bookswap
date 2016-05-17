function flashNotice(type,msg){
	$('.flash-container').append('<h2 class="flash-'+type+'">' + msg + '</h2>');
	setTimeout(function(){
		$('.flash-container').empty();
	},3500)
}