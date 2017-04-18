<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 03/01/17
  Time: 16:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>

    <title>Nuevo Personal</title>
    <g:set var="formLayout"  value="Nuevo Personal" scope="request"/>
    <script defer src="${resource(dir: 'js', file: 'personalAngular/createPersonal.js')}"></script>
</head>

<body>
<div ng-controller="createPersonalController"  class="md-block">

    <span ng-show="messageError">
        <md-toolbar class="md-warn">
            <div class="md-toolbar-tools">
                <div class="alert alert-error" style="display: block">{{messageError}}</div>
            </div>
        </md-toolbar>
    </span>

    <span ng-show="messageSuccessful">
        <md-toolbar class="md-successful">
            <div class="md-toolbar-tools">
                <div class="message" style="display: block">{{messageSuccessful}}</div>
            </div>
        </md-toolbar>
    </span>

    <g:render template="formPersonal" collection="${cargos}" />

</div>
</body>
</html>