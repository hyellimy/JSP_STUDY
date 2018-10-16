<%@ page contentType="text/html; charset=utf-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>login screen</title>
<style>
input[type=text], select , input[type=passwd]{
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit],[type=button] {
    width: 100%;
    background-color: #4CAF50;
    color: white;
    padding: 14px 20px;
    margin: 8px 0;
    border: none;
    border-radius: 4px;
    cursor: pointer;
}

input[type=submit]:hover {
    background-color: #45a049;
}

div {
    width : 50%;
    border-radius: 5px;
    background-color: #f2f2f2;
    padding: 20px;
    margin: 10px auto;
}

h3 {
text-align: center;
}

</style>

<script type="text/javascript">
window.onload = function() {
	eventRegist();
}

function eventRegist() {
	document.getElementById("loginButton").onclick = function (){
		sendServer();
	}
	
}


function sendServer() {
	var firstName = document.getElementById("fname").value;
	
	if(!firstName || firstName.trim().length == 0 ){
		alert("입력되지 않은 값 입니다.");
	}else{
		document.loginForm.action = "/servlet/receive.do"; 
		document.loginForm.method = "get"; 
		document.loginForm.submit(); 
		
	} 
}
</script>


</head>
<body>

<h3>계좌 등록</h3>

<div>
  <form name="accountForm"  action="accountAction.jsp" method="post">
    <label for="accountNum">계좌번호</label>
    <input type="text" id="accountNum" name="accountNum" placeholder="계좌번호">

    <label for="accountOwner">예금주</label>
    <input type="text" id="accountOwner" name="accountOwner" placeholder="예금주">

    <label for="passwd">비밀번호</label>
    <input type="passwd" id="passwd" name="passwd" placeholder="비밀번호">

    <label for="restMoney">입금금액</label>
    <input type="text" id="restMoney" name="restMoney" placeholder="입금금액">


    
    <input type="submit" value="등록"  id="loginButton">
    
  </form>
</div>

</body>
</html>
