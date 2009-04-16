function JSONscriptRequest(fullUrl) {
	this.fullUrl = fullUrl; 
	this.noCacheIE = '&noCacheIE=' + (new Date()).getTime();
	this.headLoc = document.getElementsByTagName("head").item(0);
	this.scriptId = 'JscriptId' + JSONscriptRequest.scriptCounter++;
}
JSONscriptRequest.scriptCounter = 1;
JSONscriptRequest.prototype.buildScriptTag = function () {
	this.scriptObj = document.createElement("script");
	this.scriptObj.setAttribute("type", "text/javascript");
	this.scriptObj.setAttribute("charset", "utf-8");
	this.scriptObj.setAttribute("src", this.fullUrl + this.noCacheIE);
	this.scriptObj.setAttribute("id", this.scriptId);
}
JSONscriptRequest.prototype.removeScriptTag = function () {
	this.headLoc.removeChild(this.scriptObj);  
}
JSONscriptRequest.prototype.addScriptTag = function () {
	this.headLoc.appendChild(this.scriptObj);
}
function callbackfunc(jsonData) {
	// alert(jsonData["stat"]["hit_count"]);
	document.getElementById("count").innerHTML = jsonData["stat"]["hit_count"];
	aObj.removeScriptTag();
}
request = 'http://selva.heroku.com/count/admin?url='+window.location.href+'&callback=callbackfunc';
aObj = new JSONscriptRequest(request);
aObj.buildScriptTag();
aObj.addScriptTag();


