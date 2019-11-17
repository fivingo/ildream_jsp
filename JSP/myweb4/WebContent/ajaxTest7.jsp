<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="js/httpRequest.js"></script>
<script>
	function show() {
		var keyword = document.fm.keyword.value;
		if (keyword == '' || keyword == null) {
			var divTag = document.all.keywordList;
			divTag.style.display = 'none';
			return;
		}
		param = 'keyword=' + keyword;
		sendRequest('getKeywords.jsp', param, 'GET', showResult);
	}
	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var keyArr = data.split(',');
				var divTag = document.all.keywordList;
				if (keyArr.length == 0) {
					divTag.style.display = 'none';
					return;
				}
				
				var str = '';
				for (var i = 0; i < keyArr.length; i++) {
					str += '<a href="javascript:keySelect(\'' + keyArr[i] + '\');">' + keyArr[i] + '</a><br/>';
				}
				divTag.innerHTML = str;
				divTag.style.display = '';
			}
		}
	}
	function keySelect(key) {
		document.fm.keyword.value = key;
		var divTag = document.all.keywordList;
		divTag.style.display = 'none';
	}
</script>
</head>
<body>
	<form name="fm">
		<input name="keyword" type="text" style="width: 250px;" onkeyup="show()">
		<div id="keywordList" style="border: 1px solid gray; width: 250px; display: none;"></div>
	</form>
</body>
</html>