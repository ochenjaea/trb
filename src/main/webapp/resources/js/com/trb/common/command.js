/**
 * 단말기에 명령을 내려보내는 버튼 활성화/비활성화를 위한 Javascript
 */
var commandObject = null;
Namespace("com.trb.common",{
	Command : function() {
		commandObject = this;
	}
});

/**
 * A : 안드로이드 단말기
 * I : IOS 단말기
 * Map<String, List> 형태로 구성할 예
 */
com.trb.common.Command.prototype.deviceMap = null;

com.trb.common.Command.prototype.DEVICE_ANDROID = "A";
com.trb.common.Command.prototype.DEVICE_ANDROID_S = "AS";

com.trb.common.Command.prototype.DEVICE_IOS = "I";
com.trb.common.Command.prototype.DEVICE_IOS_S = "IS";

// 현재 선택된 단말기 종류가 섞여 있음
com.trb.common.Command.prototype.DEVICE_MIX = "MIX";
// 선택된 단말기가 없음
com.trb.common.Command.prototype.DEVICE_NONE = "NONE";
com.trb.common.Command.prototype.DEVICE_COUNT = 0;

// 현재 선택된 단말기들의 상태
com.trb.common.Command.prototype.COMMAND_STATUS = this.DEVICE_NONE;

com.trb.common.Command.prototype.init = function(target) {
	commandObject.target = target;
	$(target).html(commandObject.baseHTML());
	// 명령 콤보 박스 이벤트 걸기
	commandObject.selectEventBind();
	
	// ID 맵핑이 아닌 class나 name 맵핑인 경우 여러번 클릭이벤트가 발생할수도 있음
	$(".command").unbind("click");
	$(".commandAction").unbind("click");
	
	// 여기서 이벤트 걸어야 한번만 이벤트 걸림
	$(".command").click(function() {
		if(!$(this).hasClass("active")) return;
		commandObject.showCommandDialog($(this).attr("name").replace("button", ""));
	});
	
	$(".commandAction").click(function(event) {
		var context = new ActionContext();
		var obj = new Object();
		obj["CMD_TYPE"] = "_" + $(this).parent().parent().attr("id").split("_")[1];
		obj["TARGETLIST"] = commandObject.getDeviceList();
		context.commandAction("command", obj);
		
		doAction(context.getAction(), function(data) {
			$("#dialogModelCommand" + obj["CMD_TYPE"]).dialog('close');
		});
	});
};
com.trb.common.Command.prototype.showCommandDialog = function(cmdType) {
	var options = commandObject.getDialogOption(cmdType);
	var text = commandObject.getDialogText(cmdType);
	$("#" + cmdType.replace("_", "") + "_text").html(text);
	$("#dialogModelCommand" + cmdType).dialog(options);
};

com.trb.common.Command.prototype.getDialogText = function(cmdType) {
	var text = "";
	switch(cmdType) {
	case "_lock" :
		text = $.i18n.prop("CNF_COMMAND_DES01", commandObject.DEVICE_COUNT); break;
	case "_clearpwd" :
		text = $.i18n.prop("CNF_COMMAND_DES02", commandObject.DEVICE_COUNT); break;
	case "_lost" :	
		text = $.i18n.prop("CNF_COMMAND_DES06", commandObject.DEVICE_COUNT); break;
	case "_unlost" :
		text = $.i18n.prop("CNF_COMMAND_DES07", commandObject.DEVICE_COUNT); break;
	case "_alert" :
		text = $.i18n.prop("CNF_COMMAND_DES05", commandObject.DEVICE_COUNT); break;
	case "_avexes" :
		text = $.i18n.prop("CNF_COMMAND_DES09", commandObject.DEVICE_COUNT); break;
	case "_avexed" :
		text = $.i18n.prop("CNF_COMMAND_DES10", commandObject.DEVICE_COUNT); break;
	case "_avupdate" :
		text = $.i18n.prop("CNF_COMMAND_DES11", commandObject.DEVICE_COUNT); break;
	case "_remove" :
		text = $.i18n.prop("CNF_COMMAND_DES03"); break;
	case "_wipe" :
		text = $.i18n.prop("CNF_COMMAND_DES04"); break;
	case "_location" :
		text = $.i18n.prop("CNF_COMMAND_DES08", commandObject.DEVICE_COUNT); break;
	case "_unlock" :
	case "_notice" :
	case "_init" :
	case "_bkcontacts" :
	case "_addcontacts" :
	case "_report" :
		break;
	}
	return text;
};
com.trb.common.Command.prototype.getDialogOption = function(cmdType) {
	var options = {};
	switch(cmdType) {
	case "_lock" :
	case "_clearpwd" :
	case "_lost" :	
	case "_unlost" :
	case "_alert" :
	case "_avexed" :
	case "_avexes" :
	case "_avupdate" :
		options = {width: 370, height: 160, resizable: false, modal: true};
		break;
	case "_remove" :
	case "_wipe" :
	case "_location" :
		options = {width: 370, height: 160, resizable: false, modal: true};
		break;
	case "_unlock" :
	case "_notice" :
	case "_init" :
	case "_bkcontacts" :
	case "_addcontacts" :
	case "_report" :
		break;
	}
	return options;
};
com.trb.common.Command.prototype.selectEventBind = function() {
	/* user-content-menu2 */
	$('.user-content-menu2 a.v3').click(function(){
		if(!$(this).parent().hasClass("active")) {
			return;
		}
		var sublink = $(this).parent().children('.v3-sublink');
		if (sublink.is(':hidden'))
		{
			sublink.show();
		} else {
			sublink.hide();
		}
		return false;
	});
	$('.user-content-menu2 a.v3').parent().mouseleave(function(){
		$('.v3-sublink').hide();
	});
};
/**
 * 일단 디자인에서는 모두 비활성화 상태 또는 활성화 상태로 만든 다음
 * 상태에 따라 다시 활성화 또는 비활성화 해야하는 버튼 목록을 뽑아
 * jquery에서 간단하게 돌리도록 하자
 * 따라서 여기서 관리해야하는 정보는 버튼에 대한 ID 정보들이다
 */
com.trb.common.Command.prototype.buttonTypeList = function() {
	var buttonList = new Array();
	switch(commandObject.COMMAND_STATUS) {
	case commandObject.DEVICE_ANDROID :
		buttonList.push("button_lock");
		buttonList.push("button_clearpwd");
		buttonList.push("button_remove");
		buttonList.push("button_wipe");
		buttonList.push("button_alert");
		buttonList.push("button_lost");
		buttonList.push("button_unlost");
		buttonList.push("button_location");
		buttonList.push("button_avaction");
		break;
	case commandObject.DEVICE_ANDROID_S :
		buttonList.push("button_lock");
		buttonList.push("button_clearpwd");
		buttonList.push("button_alert");
		buttonList.push("button_lost");
		buttonList.push("button_unlost");
		buttonList.push("button_location");
		buttonList.push("button_avaction");
		break;
	case commandObject.DEVICE_IOS :
		buttonList.push("button_lock");
		buttonList.push("button_clearpwd");
		buttonList.push("button_wipe");
		break;
	// 보여줘야할 내용은 똑같음
	case commandObject.DEVICE_IOS_S :
	case commandObject.DEVICE_MIX :
		buttonList.push("button_lock");
		buttonList.push("button_clearpwd");
		break;
	// 
	case commandObject.DEVICE_NONE :
		break;
	}
	return buttonList;
};
// 장비 추가
com.trb.common.Command.prototype.put = function(deviceList) {
	commandObject.DEVICE_COUNT = deviceList.length;
	commandObject.deviceMap = {
		"A" : new Array(),
		"I" : new Array()
	};
	$.each(deviceList, function(index, item) {
		// 타입에 따라 바꾸기
		if(item.DEV_OS.contains("Android")) item.DEV_OS = "A";
		else item.DEV_OS = "I";
		
		var seqList = commandObject.deviceMap[item.DEV_OS];
		seqList.push(item.key);
	});
	commandObject.setStatus();
};
// 목록 반환하기
com.trb.common.Command.prototype.getDeviceList = function() {
	var returnList = new Array();
	
	for(var name in commandObject.deviceMap) {
		$.each(commandObject.deviceMap[name], function(index, item) {
			returnList.push({DEV_SEQ : item, DEV_OS : name});
		});
	}
	
	return returnList;
};
/**
 * 상태를 설정하고 버튼까지 재배열 한다.
 */
com.trb.common.Command.prototype.setStatus = function() {
	var android = commandObject.deviceMap[commandObject.DEVICE_ANDROID];
	var ios = commandObject.deviceMap[commandObject.DEVICE_IOS];
	if(android.length == 0 && ios.length == 0) {
		commandObject.COMMAND_STATUS = commandObject.DEVICE_NONE;
	}
	else if(android.length > 1 && ios.length == 0) {
		commandObject.COMMAND_STATUS = commandObject.DEVICE_ANDROID_S;
	}
	else if(android.length == 1 && ios.length == 0) {
		commandObject.COMMAND_STATUS = commandObject.DEVICE_ANDROID;
	}
	else if(android.length == 0 && ios.length > 1) { 
		commandObject.COMMAND_STATUS = commandObject.DEVICE_IOS_S;
	}
	else if(android.length == 0 && ios.length == 1) { 
		commandObject.COMMAND_STATUS = commandObject.DEVICE_IOS;
	}
	else {
		commandObject.COMMAND_STATUS = commandObject.DEVICE_MIX;
	}
	
	$(".command").removeClass("active");
	$('.user-content-menu2 a.v3').parent().removeClass("active");
	
	// 장비 타입에 따라서 실행 가능한 목록 선별하기
	$.each(commandObject.buttonTypeList(), function(index, item) {
		$(commandObject.target + " li[name='" + item + "']").addClass("active");
		if(item == "button_avaction") {
			$("li[name='button_avexes']").addClass("active");
			$("li[name='button_avexed']").addClass("active");
			$("li[name='button_avupdate']").addClass("active");
		}
	});
};
/**
 * 디자인이 나오면 넣어야할 부분
 * 아마 버튼들의 목록이 들어가겠지??
 */ 
com.trb.common.Command.prototype.baseHTML = function() {
	var html = '';
	html += '<ul>';
	html += '	<li class="command" name="button_lock"><a href="#" class="remote-lock">' + $.i18n.prop("BTN_COMMAND_BTN01") + '</a></li>';
	html += '	<li class="command" name="button_clearpwd"><a href="#" class="lock-clear">' + $.i18n.prop("BTN_COMMAND_BTN02") + '</a></li>';
	html += '	<li class="command" name="button_remove"><a href="#" class="remote-delete">' + $.i18n.prop("BTN_COMMAND_BTN03") + '</a></li>';
	html += '	<li class="command" name="button_wipe"><a href="#" class="remote-reset">' + $.i18n.prop("BTN_COMMAND_BTN04") + '</a></li>';
	html += '	<li class="command" name="button_alert"><a href="#" class="beep">' + $.i18n.prop("BTN_COMMAND_BTN05") + '</a></li>';
	html += '	<li class="command" name="button_lost"><a href="#" class="lose-mode">' + $.i18n.prop("BTN_COMMAND_BTN06") + '</a></li>';
	html += '	<li class="command" name="button_unlost"><a href="#" class="lose-mode-clear">' + $.i18n.prop("BTN_COMMAND_BTN061") + '</a></li>';
	html += '	<li class="command" name="button_location"><a href="#" class="loc">' + $.i18n.prop("BTN_COMMAND_BTN07") + '</a></li>';
	html += '	<li name="button_avaction">';
	html += '		<a href="#" class="v3"><span>' + $.i18n.prop("BTN_COMMAND_BTN08") + '</span></a>';
	html += '		<ul class="v3-sublink">';
	html += '			<li class="command" name="button_avexes"><a href="#" class="fast-check">' + $.i18n.prop("BTN_COMMAND_BTN081") + '</a></li>';
	html += '			<li class="command" name="button_avexed"><a href="#" class="ex-check">' + $.i18n.prop("BTN_COMMAND_BTN082") + '</a></li>';
	html += '			<li class="command" name="button_avupdate"><a href="#" class="update">' + $.i18n.prop("BTN_COMMAND_BTN083") + '</a></li>';
	html += '		</ul>';
	html += '	</li>';
	html += '</ul>';
	return html;
};