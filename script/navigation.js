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

function isBigDevice()
{
	var bigDevice = window.matchMedia("screen and (min-width: 1250px)")
	return bigDevice.matches
}

function toggleNavigation()
{	
	if (isBigDevice())
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

function disableNavigationOnSmallDevices()
{
	if (isBigDevice())
	{	
		enableNavigation()
		return
	}
	
	disableNavigation()
	event.stopPropagation()
}