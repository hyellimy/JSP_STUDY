<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<style>
input[type=text], input[type=password] {
    width: 100%;
    padding: 12px 20px;
    margin: 8px 0;
    display: inline-block;
    border: 1px solid #ccc;
    border-radius: 4px;
    box-sizing: border-box;
}

input[type=submit] {
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
    width: 600px;
    border-radius: 5px;
    background-color: #f2f2f2;
    margin: 50px auto;
    padding: 20px;
}
</style>
<body>

<div>
<p style="color: red">※ <%=request.getAttribute("uri") %> 페이지는 로그인시에만 서비스 가능합니다.</p>
<h3>Login Form</h3>
  <form action="<%=application.getContextPath() %>/user/loginAction.jsp">
    <label for="fname">Identifier</label>
    <input type="text" name="userid" placeholder="Identifier..">

    <label for="lname">Password</label>
    <input type="password" name="userpw" placeholder="Password..">
  
    <input type="submit" value="Login">
  </form>
</div>

</body>
</html>
