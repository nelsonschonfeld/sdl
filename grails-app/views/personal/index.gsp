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
<div ng-controller="listPersonalController" class="md-block" ng-init="misPers=${personales}">
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
    <md-list ng-cloak>
        <div ng-show="existsPersons(misPers | filter:'true')">
        <md-subheader class="md-no-sticky mdl-color--blue-grey">
            <div flex="100" layout="row" layout-align="space-between center">
                <b>Personales Activos</b>
                <md-checkbox aria-label="Select All"
                             ng-checked="isCheckedActive(misPers  | filter:'true')"
                             md-indeterminate="isIndeterminateActive(misPers  | filter:'true')"
                             ng-click="toggleAllActive(misPers  | filter:'true')">
                    Seleccionar Todos
                    <button ng-show="allChekedActive" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}" class="s24" aria-label="Cake"></md-icon>
                    </button>
                </md-checkbox>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in misPers | filter:'true' track by personal.id" ng-click="viewDetailsPersonal(personal)"
                      class="noright" >
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_outline_black_18px.svg')}"
                 class="md-avatar"/>

            <p>{{personal.name}} - {{personal.surname}} - {{personal.dateBorn}} - {{personal.cuil}} - {{personal.addres}} - Cargo Id: {{personal.cargo.id}}</p>
            <md-checkbox class="md-secondary" ng-checked="existsActive(personal.id, selectedActive)"
                         ng-click="toggleActive(personal.id, selectedActive)" aria-label="Check"></md-checkbox>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_update_black_18px.svg')}"
                     ng-click="updatePersonal(personal, $event)" aria-label="Modificar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"
                     ng-click="deletePersonal(personal, $event)" aria-label="Eliminar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_swap_horiz_black_18px.svg')}"
                     ng-click="inactivePersonal(personal, $event)" aria-label="Act Desact" class="md-secondary"></md-icon>
        </md-list-item>
        </div>
        <div ng-show="existsPersons(misPers  | filter:'false')">
        <md-subheader class="md-no-sticky mdl-color--blue-grey ">
            <div flex="100" layout="row" layout-align="space-between center">
                <b>Personales Inactivos</b>
                <md-checkbox aria-label="Select All"
                             ng-checked="isCheckedInactive(misPers | filter:'false')"
                             md-indeterminate="isIndeterminateInactive(misPers | filter:'false')"
                             ng-click="toggleAllInactive(misPers | filter:'false')">
                    Seleccionar Todos
                    <button ng-show="allChekedInactive" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                        <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}" class="s24" aria-label="Cake"></md-icon>
                    </button>
                </md-checkbox>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in misPers | filter:'false'" ng-click="viewDetailsPersonal(personal)"
                      class="noright">
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"
                 class="md-avatar"/>

            <p>{{personal.name}} - {{personal.dateBorn}} - {{personal.cuil}} - Cargo Id: {{personal.cargo.id}}</p>
            <md-checkbox class="md-secondary" ng-checked="existsInactive(personal.id, selectedInactive)"
                         ng-click="toggleInactive(personal.id, selectedInactive)" aria-label="Check"></md-checkbox>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_update_black_18px.svg')}"
                     ng-click="updatePersonal(personal)" aria-label="Modificar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"
                     ng-click="deletePersonal(personal, $event)" aria-label="Eliminar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_swap_horiz_black_18px.svg')}"
                     ng-click="inactivePersonal(personal, $event)" aria-label="Act Desact" class="md-secondary"></md-icon>
        </md-list-item>
            </div>
    </md-list>
</div>

<div style="visibility: hidden">
    <div class="md-dialog-container" id="myDialog">
        <md-dialog layout-padding>
            <md-toolbar>
                <div class="md-toolbar-tools">
                    <h2>Actualizando: {{updateName}}</h2>
                    <span flex></span>
                    <md-button class="md-icon-button" ng-click="cancel()">
                        <md-icon aria-label="Close dialog" md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"></md-icon>
                    </md-button>
                    <span ng-show="messageDialogError">
                        <md-toolbar class="md-warn">
                            <div class="md-toolbar-tools">
                                <div class="alert alert-error" style="display: block">{{messageDialogError}}</div>
                            </div>
                        </md-toolbar>
                    </span>

                    <span ng-show="messageDialogSuccessful">
                        <md-toolbar class="md-successful">
                            <div class="md-toolbar-tools">
                                <div class="messageDialog" style="display: block">{{messageDialogSuccessful}}</div>
                            </div>
                        </md-toolbar>
                    </span>
                </div>
            </md-toolbar>
            <g:render template="formPersonal" collection="${cargos}" />
        </md-dialog>
    </div>
</div>
</body>
</html>