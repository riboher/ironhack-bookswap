function setMasonryLayout(){
		imagesLoaded('.row',function(){
			var grid = new Packery('.row',{
				itemSelector: '.book',
				percentPosition: true,
				
			});

			$(".book").flip({
			  	trigger: 'click',
			  	autoSize: true
			});

			var backCards = document.getElementsByClassName('back');
			for( var i = 0; i < backCards.length; i++){
				backCards[i].className = 'back';
			}
		});
	}