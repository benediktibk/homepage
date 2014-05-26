$(function() 
{
	var navigation = $('.navigation');
	var navigationY = navigation.offset().top;
	var isFixed = false;
	var $window = $(window);
	$window.scroll(function() 
		{
			navigation.css(
			{
				position: 'fixed',
				top: 0,
				left: navigation.offset().left,
				width: navigation.width()
			});
		});
}); 
