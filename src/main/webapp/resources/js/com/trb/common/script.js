
var contextPath =  getContextPath();

var home = function(){

	var url = contextPath+'/pageView/main.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var word = function(){

	var url = contextPath+'/pageView/word.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var etc = function(){

	var url = contextPath+'/pageView/etc.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var etc2 = function(){

	var url = contextPath+'/pageView/etc2.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var etc3 = function(){

	var url = contextPath+'/pageView/etc3.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var listLng = function(){
	
	var url = contextPath+'/pageView/listLng.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var bibleListKor = function(){

	var url = contextPath+'/pageView/bibleListKor.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var bibleListEng = function(){
	var url = contextPath+'/pageView/bibleListEng.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var bibleListKEng = function(){

	var url = contextPath+'/pageView/bibleListKEng.do';
	$.mobile.changePage(url,{transition:"fade", reverse:true});
};

var bibleNumListKor = function(number){
	
	if(number != 999){
	
		var url = contextPath+'/pageView/bibleNumList.do?type=kor&number='+number;
		$.mobile.changePage(url,{transition:"fade", reverse:true});
	}
};
var bibleNumListEng = function(number){
	
	if(number != 999){
	
		var url = contextPath+'/pageView/bibleNumList.do?type=eng&number='+number;
		$.mobile.changePage(url,{transition:"fade", reverse:true});
	}
};
var bibleNumListKEng = function(number){
	
	if(number != 999){
	
		var url = contextPath+'/pageView/bibleNumList.do?type=keng&number='+number;
		$.mobile.changePage(url,{transition:"fade", reverse:true});
	}
};

var korContent = function(osis,chapter){
	
	var url = contextPath+'/pageView/korContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'kor');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'kor');
};

var engContent = function(osis,chapter){

	var url = contextPath+'/pageView/engContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'eng');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'eng');
};

var kengContent = function(osis,chapter){

	var url = contextPath+'/pageView/kengContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'keng');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'keng');
};


var korBigContent = function(osis,chapter){

	var url = contextPath+'/pageView/korBigContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'kor');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'kor');
};

var engBigContent = function(osis,chapter){

	var url = contextPath+'/pageView/engBigContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'eng');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'eng');
};

var kengBigContent = function(osis,chapter){

	var url = contextPath+'/pageView/kengBigContent.do?chapter='+chapter+'&osis='+osis;
	save(osis,chapter,'keng');
	$.mobile.changePage(url,{transition:"fade", reverse:true});
	save(osis,chapter,'keng');
};

var checkEnter = function(keyCode){
	
	var word = $("#search").val(); 
		
	if(keyCode == 13) 
	{
		location.href = contextPath+'/pageView/word.do?word='+word;
	}
};
var save = function(osis,chap,type){
		$.cookie("losis", osis, { expires : 365, path: '/'});
		$.cookie("lchap", chap, { expires : 365, path: '/'});
		$.cookie("ltype", type, { expires : 365, path: '/'});
};

var load = function(){
	var losis = $.cookie("losis"); 
	var lchap = $.cookie("lchap"); 
	var ltype = $.cookie("ltype"); 

	if(ltype == "kor"){
		korContent(losis,lchap);
	}
	else if(ltype == "eng"){
		engContent(losis,lchap);
	}
	else if(ltype == "keng"){
		kengContent(losis,lchap);
	}
	else{
		home();
	}
};

var executeURLLink = function(msg1,count,msg2){
	
	var msg = msg1 + ":" + count + " " + msg2 +" -TR 성경책-";
	
    kakao.link("talk").send({
        msg : msg,
        url : "",
        appid : "m.kakao.com",
        appver : "2.0",
        appname : "",
        type : "link"
    });
};

var  executeKakaoStoryLink = function(msg1,count,msg2){
	var msg = msg1 + ":" + count + " " + msg2 +" -TR 성경책-";
	var img = "http://localhost:8080/"+contextPath+'/resources/images/msg.png';
    kakao.link("story").send({   
       post : msg,
        appid : "",
        appver : "1.0",
        appname : "TR 성경책",

    });
};

var publishStory = function(chapter1,chapter2,fullcontent,startNum,EndNum,type) {
	var content = fullcontent+" "+chapter1+":"+chapter2;
	var page = startNum+"!"+EndNum;
 
	document.write('<div id="Load" style="position:absolute;width:100%;height:100%;top:0;left:0;background-color:#45489d;"><span style="color:white;font-size:35px;">Facebook Connecting.....</span></div>');
	
	var feed_url="https://www.facebook.com/dialog/feed?";
  	feed_url += "app_id=448318655211968&";
  	feed_url += "picture=http://211.232.30.248:8080/trb/resources/images/msg.png&";
  	feed_url += "caption="+content+"&";	
	feed_url += "redirect_uri=http://211.232.30.248:8080/trb/pageView/"+type+".do?page="+page;
  //	feed_url += "redirect_uri=http://192.168.55.9:8080/bible/boanochenjae/today/today.jsp";

	location.href=feed_url;
};

var test = function(){


	    // Additional initialization code such as adding Event Listeners goes here
	

	
	
	FB.ui({
		 method: 'feed',
		  message: 'getting educated about Facebook Connect',
		  name: 'Connect',
		  caption: 'The Facebook Connect JavaScript SDK',
		  description: (
		      'A small JavaScript library that allows you to harness ' +
		      'the power of Facebook, bringing the user\'s identity, ' +
		      'social graph and distribution power to your site.'
		  ),
		  link: 'http://www.fbrell.com/',
		  picture: 'http://www.fbrell.com/public/f8.jpg',
		  actions: [
		    { name: 'fbrell', link: 'http://www.fbrell.com/' }
		  ]
		}, function(response){});
};