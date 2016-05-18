$(document).on('page:change',function(){
  $('.sliding-panel-button,.sliding-panel-fade-screen,.sliding-panel-close').on('click touchstart',function (e) {
    $('.sliding-panel-content,.sliding-panel-fade-screen').toggleClass('is-visible');
    e.preventDefault();
    console.log("CLICKADO");
  }); 

  // var grid = $('.row').isotope({
  //   		itemSelector: '.item',
  //   	  	masonry: {
  //   	  		percentPosition: true,
  //   	    	columnWidth: '.item',
  //   	    	// gutter: 20,
  //   	    	fitWidth: true
  //   	  	}
  // });
  // grid.imagesLoaded().progress(function() {
  //   grid.isotope('layout');
  // });


  // $('.js-sticky-bar').sticky({topSpacing:20});
  $('.item-box').mouseenter(function(){
      $(this).find('.add-item').css('opacity',1);
      $(this).find('.add-item').css('transform','scale(1)');
    }).mouseleave(function(){
      $(this).find('.add-item').css('opacity',0);
      $(this).find('.add-item').css('transform','scale(0)');
  });
});
