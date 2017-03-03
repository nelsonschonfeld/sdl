<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 03/01/17
  Time: 16:28
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="page"/>
    <title>Personal</title>

</head>
<body>
<md-list ng-cloak>
    <md-subheader class="md-no-sticky">Personales</md-subheader>
    <md-list-item ng-repeat="personal in ${personales}" ng-click="goToPerson(person.name, $event)" class="noright">
        <img alt="{{personal.name}}" ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" class="md-avatar" />
        <p>{{personal.name}} - {{personal.dateBorn}} - {{personal.cuil}} - Cargo Id: {{personal.cargo.id}}</p>
        <md-checkbox class="md-secondary" ng-model="person.selected"></md-checkbox>
        <md-icon md-svg-icon="communication:email"  ng-click="doSecondaryAction($event)" aria-label="Send Email" class="md-secondary md-hue-3" ></md-icon>
        <md-icon class="md-secondary" ng-click="doSecondaryAction($event)" aria-label="Chat" md-svg-icon="communication:message"></md-icon>
    </md-list-item>
</md-list>
</body>
</html>