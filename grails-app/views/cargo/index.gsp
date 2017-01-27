<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 04/01/17
  Time: 15:05
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <title></title>
</head>

<body>
CARGOS

<g:each in="${cargoList}" var="cargo">
    <li>${cargo.name}</li>
</g:each>
</body>
</html>