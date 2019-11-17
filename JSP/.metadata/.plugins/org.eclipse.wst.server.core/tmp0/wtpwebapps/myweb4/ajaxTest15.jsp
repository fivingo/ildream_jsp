<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show() {
		/*
		var fruit={apple:'사과',banana:'바나나',melon:'멜론'};
		window.alert(fruit.banana);
		window.alert(fruit.apple);
		 */

		/*
		var comBrand=['Mac','IBM','SAMSUNG','LG','Dell'];
		window.alert(comBrand[2]);
		 */

		var student = {
			name : '홍길동',
			age : 20,
			record : [ 90, 80, 70 ]
		};

		window.alert('응시자명: ' + student.name + ' / 나이: ' + student.age + '\n응시과목수: ' + student.record.length
				+ '과목\n두번째 응시과목 점수: ' + student.record[1]);
	}
</script>
</head>
<body>
	<input type="button" value="json테스트" onclick="show()">
</body>
</html>