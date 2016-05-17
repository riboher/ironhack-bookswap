$(function(){
	$('.edit-button').on('click',function(event){
		event.preventDefault();
		var attribute = $(this).data('user');
		$('.'+attribute).prop('disabled',false);
	});
});