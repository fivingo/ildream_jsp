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
		var country = document.fm.country.value;
		var param = 'country=' + country;
		sendRequest('getAnititle.jsp', param, 'GET', showResult);
	}
	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var aniArr = data.split(',');
				var str = '';
				for (var i = 0; i < aniArr.length; i++) {
					str += '<option>' + aniArr[i] + '</option>';
				}
				
				var aniTag = document.all.aniList;
				aniTag.innerHTML = str;
			}
		}
	}
</script>
</head>
<body>
	<form name="fm">
		국가:<select id="country" onchange="show()">
			<option value="kor">한국</option>
			<option value="usa">미국</option>
			<option value="jap">일본</option>
		</select>
		애니목록:<select id="aniList"></select>
	</form>
</body>
</html>