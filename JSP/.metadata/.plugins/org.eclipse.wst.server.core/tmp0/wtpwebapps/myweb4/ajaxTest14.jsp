<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
	function show() {
		var Member = function() {
			this.name;
			this.age;
			this.addr;
		}
		Member.prototype.setInfo = function(name, age, addr) {
			this.name = name;
			this.age = age;
			this.addr = addr;
		}
		Member.prototype.getInfo = function() {
			var str = '이름: ' + this.name + ' / 나이: ' + this.age + ' / 주소: ' + this.addr;
			return str;
		}

		var mem = new Member();
		mem.setInfo('홍길동', 20, '서울');
		
		alert(mem.getInfo());
		alert(mem.name);
		alert(mem.age);
		alert(mem.addr);
	}
</script>
</head>
<body>
	<input type="button" value="객체테스트" onclick="show()">
</body>
</html>