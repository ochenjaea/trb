

function initMessage(initCallback, target) {
	$.i18n.properties({
		path:contextPath + "/properties/" + currentLocale,
	    mode:'map',  
	    callback: function() {
	    	code.init(initCallback, target);
		}
	});
}


//파라미터 받기
var paramRequest = function()
{
	this.getParameter = function( name )
	{
		var rtnval = '';
		var nowAddress = decodeURIComponent(location.href);
		var parameters = (nowAddress.slice(nowAddress.indexOf('?')+1,nowAddress.length)).split('&');
		for(var i = 0 ; i < parameters.length ; i++)
		{
			var varName = parameters[i].split('=')[0];
			if(varName.toUpperCase() == name.toUpperCase())
			{
				rtnval = parameters[i].split('=')[1];
				
			}
		}
		return rtnval;
	}		
};

//컨테스트 패스
function getContextPath(){
    var offset=location.href.indexOf(location.host)+location.host.length;
    var ctxPath=location.href.substring(offset,location.href.indexOf('/',offset+1));
    return ctxPath;
}

