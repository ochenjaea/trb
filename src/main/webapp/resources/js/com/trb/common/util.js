/**
 * 비통기 통신
 * 
 * @param url
 * @param param
 * @param sucessCallback
 * @param errorFunction
 */
function doAction(param, sucessCallback, errorCallback) {
	url = contextPath + "/ajax/ajaxCall.do";
	$.ajax({
		type : 'POST',
		url : url,
		contentType : 'application/json; charset=utf-8',
		data : $.toJSON(param),
		dataType : 'json',
		success : function(data) {
			if (sucessCallback) {
				sucessCallback.call(this, data);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			// 세션 타임아웃
			if (jqXHR.status == 403) {
				window.location.reload();
				return;
			}
			if (errorCallback != null) {
				errorCallback.call(jqXHR, textStatus, errorThrown);
			} else {
				commonError.call(jqXHR, textStatus, errorThrown);
			}
		}
	});
}

function doTreeAction(operation, param, sucessCallback, errorCallback) {
	$.ajax({
		type : 'POST',
		url : contextPath + "/treeEdit/" + operation + ".do",
		contentType : 'application/json; charset=utf-8',
		data : $.toJSON(param),
		dataType : 'json',
		success : function(data) {
			if (sucessCallback) {
				sucessCallback.call("", data);
			}
		},
		error : function(jqXHR, textStatus, errorThrown) {
			if (jqXHR.status == 403) {
				window.location.reload();
				return;
			}
			if (errorCallback != null) {
				errorCallback.call(jqXHR, textStatus, errorThrown);
			} else {
				commonError.call(jqXHR, textStatus, errorThrown);
			}
		}
	});
}
/**
 * 폼 ajax 전송
 * 
 * @param url
 * @param params
 * @returns {___anonymous954_1115}
 */
function getFormAjaxData(url, params, paramFunc) {
	var func;
	if (paramFunc == null) {
		func = function() {
			window.location = url;
		};
	} else {
		func = paramFunc;
	}

	var options = {
		action : url,
		data : params,
		resetForm : true,
		success : func,
		error : function(jqXHR, textStatus, errorThrown) {
			alert(jqXHR.status + "_" + textStatus + "_" + errorThrown + "_" + params);
		}
	};
	return options;
}
/**
 * 에러처리 공통화 만들기
 * 
 * @param jqXHR
 * @param textStatus
 * @param errorThrown
 * @return
 */
function commonError(jqXHR, textStatus, errorThrown) {
	alert("서버에서 오류가 발생했습니다. \n 관리자에게 문의바랍니다.");
}
/**
 * Input 파라미터 가져오기
 * 
 * @return
 */
function getInputData(objList, prefix) {
	var data = {};
	$.each(objList, function(i, obj) {
		if (this.type == "checkbox") {
			if (prefix) {
				if ($(this).is(":checked")) {
					data[this.name.replace(prefix + "_", "")] = true;
				} 
				else {
					data[this.name.replace(prefix + "_", "")] = false;
				}
			} 
			else {
				if ($(this).is(":checked")) {
					data[this.name] = true;
				} 
				else {
					data[this.name] = false;
				}
			}
		}
		// select option 일 경우
		else if (this.type == "select-one") {
			if ($(this).hasClass("keyword")) {
				// 값이 있을때만
				if ($("input.param[name='" + this.name + "']").val() != null&& $("input.param[name='"+ this.name + "']").val() != "") {
					data[this.options[this.selectedIndex].value] = $("input.param[name='" + this.name + "']").val();
				}
			} 
			else {
				if (prefix) {
					if ($(this).val() != null && $(this).val() != "") {
						data[this.name.replace(prefix + "_", "")] = this.options[this.selectedIndex].value;
					}
				} else {
					if ($(this).val() != null && $(this).val() != "") {
						data[this.name] = this.options[this.selectedIndex].value;
					}
				}
			}
		}
		// 일반 input type 일 경우
		else if (this.type == "text" || this.type == "textarea" || this.type == "hidden" || this.type == "password") {
			if (!$(this).hasClass("param")) {
				if (prefix) {
					data[this.name.replace(prefix + "_", "")] = this.value;
				} else {
					data[this.name] = this.value;
				}
			}
		} 
		else if (this.type == "radio") {
			if (prefix) {
				data[this.name.replace(prefix + "_", "")] = $("input[name='" + this.name + "']:checked").val();
			} 
			else {
				data[this.name] = $("input[name='" + this.name + "']:checked").val();
			}
		}
	});
	return data;
}

/**
 * select option 넣기
 * 
 * @param targetID
 * @param objList
 * @param isAll
 */
function selectOption(targetID, objList, selectID) {
	var html = "";

	$.each(objList, function(index, item) {
		if (selectID && item.ID == selectID) {
			html += "<option value='" + item.ID + "' selected='selected'>"
					+ item.NAME + "</option>";
		} else {
			html += "<option value='" + item.ID + "'>" + item.NAME
					+ "</option>";
		}
	});
	// 비우기
	$(targetID).html("");
	$(html).appendTo($(targetID));
}

/* 첨부파일 추가 UI */
function addFileElement(hiddenDivId, fileId, uiDivId, type, fileSize, fileName,
		fileSeq) {
	/*
	 * [type] "new" = new "readonly" = readOnly "update" = update
	 */
	var uiDiv = document.getElementById(uiDivId);
	var id = toTimeString(new Date(), true);

	/* 파일 이름, 파일 크기 */
	var span1 = document.createElement("span");
	var span2 = document.createElement("span");
	span1.setAttribute("class", "fileName");
	span2.setAttribute("class", "fileVol");
	if (type == "new") {
		var fullPath = $("#" + fileId).val();
		var s = fullPath.lastIndexOf("\\");
		span1.innerHTML = fullPath.substring(s + 1, fullPath.length);
	} else {
		span1.innerHTML = fileName;
		if (fileSize != "") {
			span2.innerHTML = fileSize + "KB";
		}
	}

	var link = null;
	var img = null;
	if (type == "new") {
		/* 삭제 링크 걸기 */
		link = document.createElement("a");
		link.setAttribute("class", "fileDel");
		link.setAttribute("href", "javascript:removeFileElement('" + uiDivId
				+ "','" + hiddenDivId + "','" + id + "')");

		/* 삭제 이미지 */
		img = document.createElement("img");
		img.setAttribute("src", "/resources/images/ico_del.gif");
		link.appendChild(img);

		/* hidden 파일 */
		var file = document.getElementById(fileId);
		var temp = "file_" + id;
		file.id = temp;
		file.name = temp;
		file.style.display = "none";

		var newFile = document.createElement("input");
		newFile.type = "file";
		newFile.id = fileId;
		newFile.name = fileId;
		newFile.size = 50;

		var hiddenDiv = document.getElementById(hiddenDivId);
		hiddenDiv.appendChild(newFile);
	} else if (type == "update") {
		/* 삭제 링크 걸기 */
		link = document.createElement("a");
		link.setAttribute("class", "fileDel");
		link.setAttribute("href", "javascript:removeFile('" + fileSeq + "','"
				+ uiDivId + "','" + id + "')");

		/* 삭제 이미지 */
		img = document.createElement("img");
		img.setAttribute("src", "/resources/images/ico_del.gif");
		link.appendChild(img);
	}

	/* div로 감싸기 */
	var fileDiv = document.createElement("div");
	fileDiv.id = "fileDiv_" + id;
	fileDiv.setAttribute("class", "fileList");
	if (link) {
		fileDiv.appendChild(link);
	}
	fileDiv.appendChild(span1);
	fileDiv.appendChild(span2);
	uiDiv.appendChild(fileDiv);

	if (fileId != null) {
		/* <input type='file'>의 value 지우기 */
		var obj = document.getElementById(fileId);
		obj.outerHTML = obj.outerHTML;
	}
}

/**
 * 첨부파일 전체 삭제
 * 
 * @param uiDivId
 * @param hiddenDivId
 * @param fileId
 */
function removeAllFileElement(uiDivId, hiddenDivId, fileId) {
	var uiDiv = document.getElementById(uiDivId);
	var children1 = uiDiv.childNodes;
	for ( var i = 0; i < children1.length; i++) {
		var child = children1[i];
		uiDiv.removeChild(child);
	}

	var hiddenDiv = document.getElementById(hiddenDivId);
	var children2 = hiddenDiv.childNodes;
	for ( var i = 0; i < children2.length; i++) {
		var id = children2[i].id;
		if (id) {
			if (id == fileId) {
				continue;
			} else {
				var targetFile = document.getElementById(id);
				hiddenDiv.removeChild(targetFile);
			}
		}
	}
}

/**
 * 첨부파일 삭제
 * 
 * @param uiDivId
 * @param hiddenDivId
 * @param id
 */
function removeFileElement(uiDivId, hiddenDivId, id) {
	/* UI 없애고 */
	if (uiDivId != null) {
		var uiDiv = document.getElementById(uiDivId);
		var targetDiv = document.getElementById("fileDiv_" + id);
		uiDiv.removeChild(targetDiv);
	}
	/* input=file 없애고 */
	if (hiddenDivId != null) {
		var hiddenDiv = document.getElementById(hiddenDivId);
		var targetFile = document.getElementById("file_" + id);
		hiddenDiv.removeChild(targetFile);
	}
}

/**
 * 첨부파일 추가 여부
 * 
 * @param uiDivId
 * @returns {Number}
 */
function isAttachedFile(uiDivId) {
	if (uiDivId != null) {
		var uiDiv = document.getElementById(uiDivId);
		var children = uiDiv.childNodes;
		if (children.length > 0)
			return 1;
	}
	return 0;
}

/**
 * 첨부파일 valid 체크
 */
function checkFileInfo(uiDivId, hiddenDivId, fileId) {
	var fullPath = $("#" + fileId).val();
	if (fullPath == "") {
		alert("첨부할 파일이 존재하지 않습니다.");
		return;
	}
	addFileElement(hiddenDivId, fileId, uiDivId, "new");
}

/**
 * write.jsp 첨부파일 UI
 * 
 * @param seq
 */
function displayFileList(seq, type) {
	/*
	 * [type] "modify" = write.jsp "readonly" = detail.jsp
	 */
	var context = new ActionContext();
	context.listAction("selectData", "com.nexts.kaitalk.sql.attachment.select",
			{
				DOCUMENT_ID : seq
			});
	doAction("crud", context.getAction(), function(result) {
		$(result.selectData).each(
		function() {
			var data = $(this);
			var fileName = data.attr('CONTENTS_NAME');
			var fileSize = data.attr('CONTENTS').length;
			if (type == "modify") {
				var fileSeq = data.attr('SEQ');
				addFileElement(null, "CONTENTS", "addedFileList",
						"update", "", fileName, fileSeq);
			} else if (type == "readonly") {
				var link = "<a href='javascript:download("
						+ data.attr("SEQ") + ")'>" + fileName + "</a>";
				addFileElement(null, null, "addedFileList", "readonly",
						fileSize, link);
			}
		});
	});
}

/* 파일 다운로드 링크 */
function download(fileSeq) { // ATTACH SEQ
	var queryId = "com.nexts.kaitalk.sql.attachment.select";
	window.frames["ifrm"].location = "download.do?" + "QUERYID=" + queryId
			+ "&SEQ=" + fileSeq;
}

/**
 * 자바스크립트 Date 객체를 Time 스트링으로 변환
 * 
 * @param date
 * @returns {String}
 */
function toTimeString(date, isFullDate) {
	var year = date.getFullYear();
	var month = date.getMonth() + 1; // 1월=0,12월=11이므로 1 더함
	var day = date.getDate();
	var msecond = date.getTime(); // Returns the number of milliseconds since
									// midnight Jan 1, 1970

	if (("" + month).length == 1) {
		month = "0" + month;
	}
	if (("" + day).length == 1) {
		day = "0" + day;
	}

	if (isFullDate) {
		return msecond;
	} else {
		return (year + "-" + month + "-" + day);
	}
}

function trime(str) {
	if (typeof str == "undefined")
		return "";

	return str.replace(/^\s\s*/, '').replace(/\s\s*$/, '');
}

function checkInputData(cssname) {
	var data = getInputData($("." + cssname));
	var isvalid = true;
	$.each(data, function(i, value) {
		if (typeof value == "undefined")
			isvalid = false;
		else if (trime(value) == "")
			isvalid = false;
	});

	//if (isvalid == false)
		//alert("필수 사항을 빠짐없이 입력해주세요.");

	return isvalid;
}

/**
 * 최근
 * @param target
 * @returns {String}
 */
function setMonthCalendar(target) {
	var now = new Date();
	if(target.contains("calender_startCalender")) {
		now.setMonth(now.getMonth() - 1);
		return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();	
	}
	else {
		return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
	}
}
function setWeekCalendar(target) {
	var now = new Date();
	if(target.contains("calender_startCalender")) {
		now.setDate(now.getDate() - 7);
		return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();	
	}
	else {
		return now.getFullYear() + "-" + (now.getMonth() + 1) + "-" + now.getDate();
	}
}

function getDefaultPhoneNumber(number) {
	var length = number.length;
	var prefix = number.substring(0, 2);
	if (prefix == '+82') {
		number = '0' + number.substring(3, length - 1);
	}
	return number;
}
function getObjectLength(obj) {
	var p, len = 0; // 한글문자열 체크를 위함
	for (p = 0; p < obj.val().length; p++) {
		(obj.val().charCodeAt(p) > 255) ? len += 2 : len++; // 한글체크
	}
	return len;
}

function isValidPassword(pwd, min, max) {
	var regexp = /[0-9a-zA-Z-_=+\|()*&^%$#@!~`?><\;,.:']/;
	var eng_regexp = /[a-zA-Z]/;
	var num_regexp = /[0-9]/;
	var chac_regexp = /[~!\#$^&*\=+|:;?"<,.>']/;
	var eng_count = 0;
	var num_count = 0;
	var char_count = 0;
	if(pwd.length<min) {
		return false;
	}
	if(pwd.length>max) {
		return false;
	}
	for(var i=0; i<pwd.length; i++){
		if(pwd.charAt(i) != " " && regexp.test(pwd.charAt(i)) == false ){
        	return false;
        }
        if(pwd.charAt(i) != " " && eng_regexp.test(pwd.charAt(i)) == true ){
        	eng_count++;
        }
        if(pwd.charAt(i) != " " && num_regexp.test(pwd.charAt(i)) == true ){
        	num_count++;
        }
        if(pwd.charAt(i) != " " && chac_regexp.test(pwd.charAt(i)) == true ){
        	char_count++;
        }
    }   	
	if((eng_count>0) && (num_count>0) && (char_count>0)) {
		return true;
	}else {
		return false;
	}
}

function isGap(str) {
	for(var i=0; i<str.length; i++) {
		var temp = str.charAt(i);
		if(temp == ' ' || temp == '-' || 
				temp == '_' || temp == '.') {
			return true;
		}
	}
	return false;
}

function isValidMail(email) {
	 /* 체크사항 
    - @가 2개이상일 경우 
    - .이 붙어서 나오는 경우 
    -  @.나  .@이 존재하는 경우 
    - 맨처음이.인 경우 
    - @이전에 하나이상의 문자가 있어야 함 
    - @가 하나있어야 함 
    - Domain명에 .이 하나 이상 있어야 함 
    - Domain명의 마지막 문자는 영문자 2~4개이어야 함 */ 

   var check1 = /(@.*@)|(\.\.)|(@\.)|(\.@)|(^\.)/;  
   var check2 = /^[a-zA-Z0-9\-\.\_]+\@[a-zA-Z0-9\-\.]+\.([a-zA-Z]{2,4})$/; 
    
   if (!check1.test(email) && check2.test(email)) { 
       return true; 
   }else { 
       return false; 
   } 
}

function checkNumber(str) {
	for(var i=0; i<str.length; i++) {
		if(str.charAt(i) < '0' || str.charAt(i) > '9') {
			return false;
		}
	}
	return true;
}

function getByte(str) {
	var byte = 0;
	if(str.length != 0) {
		for(var i=0; i<str.length; i++) {
			var temp = str.charAt(i);
			if(escape(temp).length > 4) {
				byte += 2;
			}else {
				byte ++;
			}
		}
	}
	return byte;
}