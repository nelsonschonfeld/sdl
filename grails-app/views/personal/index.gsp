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
    <script defer src="${resource(dir: 'js', file: 'personalAngular/listPersonal.js')}"></script>
</head>

<body>
<div ng-controller="listPersonalController">
    <md-list ng-cloak>
        <md-subheader class="md-no-sticky mdl-color--blue-grey">
            <div flex="100" layout="row" layout-align="space-between center">
                <b>Personales Activos</b>
                <md-checkbox aria-label="Select All"
                             ng-checked="isCheckedActive()"
                             md-indeterminate="isIndeterminateActive()"
                             ng-click="toggleAllActive()">
                    Seleccionar Todos
                    %{--<span ng-if="isChecked()">Un-</span>Select All--}%
                </md-checkbox>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in ${personales} | filter:'true'" ng-click="viewDetailsPersonal(personal)"
                      class="noright">
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"
                 class="md-avatar"/>

            <p>{{personal.name}} - {{personal.surname}} - {{personal.dateBorn}} - {{personal.cuil}} - {{personal.addres}} - Cargo Id: {{personal.cargo.id}}</p>
            <md-checkbox class="md-secondary" ng-checked="existsActive(personal.id, selectedActive)"
                         ng-click="toggleActive(personal.id, selectedActive)" aria-label="Check"></md-checkbox>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"
                     ng-click="deletePersonal(personal)" aria-label="Eliminar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_update_black_18px.svg')}"
                     ng-click="updatePersonal(personal)" aria-label="Modificar" class="md-secondary"></md-icon>
        </md-list-item>

        <md-subheader class="md-no-sticky mdl-color--blue-grey ">
            <div flex="100" layout="row" layout-align="space-between center">
                <b>Personales Inactivos</b>
                <md-checkbox aria-label="Select All"
                             ng-checked="isCheckedInactive()"
                             md-indeterminate="isIndeterminateInactive()"
                             ng-click="toggleAllInactive()">
                    Seleccionar Todos
                </md-checkbox>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in ${personales} | filter:'false'" ng-click="viewDetailsPersonal(personal)"
                      class="noright">
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"
                 class="md-avatar"/>

            <p>{{personal.name}} - {{personal.dateBorn}} - {{personal.cuil}} - Cargo Id: {{personal.cargo.id}}</p>
            <md-checkbox class="md-secondary" ng-checked="existsInactive(personalSelectedInactive, selectedInactive)"
                         ng-click="toggleInactive(personalSelectedInactive, selectedInactive)" aria-label="Check"></md-checkbox>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"
                     ng-click="deletePersonal(personal)" aria-label="Eliminar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_update_black_18px.svg')}"
                     ng-click="updatePersonal(personal)" aria-label="Modificar" class="md-secondary"></md-icon>
        </md-list-item>
    </md-list>
</div>
</body>
</html>