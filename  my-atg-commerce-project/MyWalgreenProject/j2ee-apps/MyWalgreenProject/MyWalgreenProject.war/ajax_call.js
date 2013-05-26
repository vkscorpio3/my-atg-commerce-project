/***********************************************
	 * Dynamic Ajax Content- ©  Dynamic Drive DHTML code library (www.dynamicdrive.com)
	 * This notice MUST stay intact for legal use
	 * Visit Dynamic Drive at http://www.dynamicdrive.com/ for full source code
	 ***********************************************/

	var bustcachevar = 1
	//bust potential caching of external pages after initial request? (1=yes, 0=no)
	var loadedobjects = ""
	var rootdomain = "http://" + window.location.hostname
	var bustcacheparameter = ""

	function ajaxpage(url, containerid) {
		var page_request = false
		if (window.XMLHttpRequest) // if Mozilla, Safari etc
			page_request = new XMLHttpRequest()
		else if (window.ActiveXObject) { // if IE
			try {
				page_request = new ActiveXObject("Msxml2.XMLHTTP")
			} catch (e) {
				try {
					page_request = new ActiveXObject("Microsoft.XMLHTTP")
				} catch (e) {
				}
			}
		} else
			return false
		page_request.onreadystatechange = function() {
			loadpage(page_request, containerid)
		}
		if (bustcachevar) //if bust caching of external page
			bustcacheparameter1 = (url.indexOf("?") != -1) ? "&"
					+ new Date().getTime() : "?" + new Date().getTime()
			
	}
	function ajaxpage1(url1, containerid1,url2, containerid2,url3, containerid3) {
		var page_request1 = false
		var page_request2 = false
		var page_request3 = false
		if (window.XMLHttpRequest){ // if Mozilla, Safari etc
			page_request1 = new XMLHttpRequest()
			page_request2 = new XMLHttpRequest()
			page_request3 = new XMLHttpRequest()
		}
		else if (window.ActiveXObject) { // if IE
			try {
				page_request1 = new ActiveXObject("Msxml2.XMLHTTP")
				page_request2 = new ActiveXObject("Msxml2.XMLHTTP")
				page_request3 = new ActiveXObject("Msxml2.XMLHTTP")
			} catch (e) {
				try {
					page_request1 = new ActiveXObject("Microsoft.XMLHTTP")
					page_request2 = new ActiveXObject("Microsoft.XMLHTTP")
					page_request3 = new ActiveXObject("Microsoft.XMLHTTP")
				} catch (e) {
				}
			}
		} else
			return false
		page_request1.onreadystatechange = function() {
			loadpage(page_request1, containerid1)
		}
		page_request2.onreadystatechange = function() {
			loadpage(page_request2, containerid2)
		}
		page_request3.onreadystatechange = function() {
			loadpage(page_request3, containerid3)
		}
		if (bustcachevar) //if bust caching of external page
		{	bustcacheparameter1 = (url1.indexOf("?") != -1) ? "&"
					+ new Date().getTime() : "?" + new Date().getTime()
			bustcacheparameter2 = (url2.indexOf("?") != -1) ? "&"
							+ new Date().getTime() : "?" + new Date().getTime()
			bustcacheparameter3 = (url3.indexOf("?") != -1) ? "&"
									+ new Date().getTime() : "?" + new Date().getTime()
		}
		page_request1.open('GET', url1 + bustcacheparameter1, true)
		page_request1.send(null)
		page_request2.open('GET', url2 + bustcacheparameter2, true)
		page_request2.send(null)
		page_request3.open('GET', url3 + bustcacheparameter3, true)
		page_request3.send(null)
	}
	function loadpage(page_request, containerid) {
		if (page_request.readyState == 4
				&& (page_request.status == 200 || window.location.href
						.indexOf("http") == -1))
			document.getElementById(containerid).innerHTML = page_request.responseText
	}

	function loadobjs() {
		if (!document.getElementById)
			return
		for (i = 0; i < arguments.length; i++) {
			var file = arguments[i]
			var fileref = ""
			if (loadedobjects.indexOf(file) == -1) { //Check to see if this object has not already been added to page before proceeding
				if (file.indexOf(".js") != -1) { //If object is a js file
					fileref = document.createElement('script')
					fileref.setAttribute("type", "text/javascript");
					fileref.setAttribute("src", file);
				} else if (file.indexOf(".css") != -1) { //If object is a css file
					fileref = document.createElement("link")
					fileref.setAttribute("rel", "stylesheet");
					fileref.setAttribute("type", "text/css");
					fileref.setAttribute("href", file);
				}
			}
			if (fileref != "") {
				document.getElementsByTagName("head").item(0).appendChild(
						fileref)
				loadedobjects += file + " " //Remember this object as being already added to page
			}
		}
	}