function enableNavigation()
{
	var navigationTopContainer = document.getElementById("navigationTopContainer")
	var navigationContainer = document.getElementById("navigationContainer")
	
	navigationTopContainer.style.display = "none"
	navigationContainer.style.display = "inline-block"
}

function disableNavigation()
{
	var navigationTopContainer = document.getElementById("navigationTopContainer")
	var navigationContainer = document.getElementById("navigationContainer")
	
	navigationTopContainer.style.display = "inline-block"
	navigationContainer.style.display = "none"
}

function toggleNavigation()
{
	var bigDevice = window.matchMedia("screen and (min-width: 1250px)");
	
	if (bigDevice.matches)
	{	
		enableNavigation()
		return
	}
	
	var navigationTopContainer = document.getElementById("navigationTopContainer")
	var navigationContainer = document.getElementById("navigationContainer")
	var navigationCurrentVisible = navigationTopContainer.style.display == "none"
	
	if (navigationCurrentVisible)
		disableNavigation()
	else
		enableNavigation()
	
	event.stopPropagation()
}