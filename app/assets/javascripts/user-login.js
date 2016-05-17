$(function(){
	var signInButton = $('#sign');
	var logInButton = $('#log');

	signInButton.on('click',function(){
		showLogForm('signup');
	});

	logInButton.on('click',function(){
		showLogForm('login');
	});


	function showLogForm(method){
		$('.js-' + method + '-form').find('#modal-1').prop('checked',true);
	}
});