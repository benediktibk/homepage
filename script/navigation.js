$(function() 
{
	var navigation = $('.navigation');
	var navigationY = navigation.offset().top;
	var isFixed = false;
	var $window = $(window);
	$window.scroll(function() 
		{
			var scrollTop = $window.scrollTop();
			var shouldBeFixed = scrollTop > navigationY;
			if (shouldBeFixed && !isFixed) 
			{
				navigation.css(
				{
					position: 'fixed',
					top: 0,
					left: navigation.offset().left,
					width: navigation.width()
				});
				isFixed = true;
			}
			else if (!shouldBeFixed && isFixed)
			{
				navigation.css(
				{
					position: 'static'
				});
				isFixed = false;
			}
		});
}); 
