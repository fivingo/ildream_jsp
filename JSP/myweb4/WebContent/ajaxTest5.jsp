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
		sendRequest('getRecord.jsp', null, 'GET', showResult);
	}
	function showResult() {
		if (XHR.readyState == 4) {
			if (XHR.status == 200) {
				var data = XHR.responseText;
				var strArr = data.split(',');
				var intArr = new Array(strArr.length);
				
				var max = 0;
				var sum = 0;
				for (var i = 0; i < strArr.length; i++) {
					intArr[i] = parseInt(strArr[i]);
					sum += intArr[i];
					if (max < intArr[i]) {
						max = intArr[i];
					}
				}
				var avg = sum / intArr.length;

				var maxTag = document.all.max;
				maxTag.innerHTML = max + '점';

				var sumTag = document.all.sum;
				sumTag.innerHTML = sum + '점';

				var avgTag = document.all.avg;
				avgTag.innerHTML = avg + '점';
			}
		}
	}
</script>
</head>
<body>
<table border="1" cellspacing="0" width="450">
	<tr><th colspan="2" align="center">시험결과 확인</th></tr>
	<tr><th>총점</th><td id="sum">--점</td></tr>
	<tr><th>평균</th><td id="avg">--점</td></tr>
	<tr><th>최고점수</th><td id="max">--점</td></tr>
	<tr><td colspan="2" align="center">
	<input type="button" value="결과확인" onclick="show()"></td></tr>
</table>
</body>
</html>