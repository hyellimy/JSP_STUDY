<%@ page contentType="text/html; charset=utf-8" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>EL 디폴트 객체 (11개)</title>
</head>
<body>
${"김기정" }
${'김기정'}
${10 }
${NULL }
${true }
${false }
<br>

<%=10 + "20" %>,${10+"20" }<br>

${ true && false }, ${true and false  }
${empty null }
${empty "" }

</body>
</html>