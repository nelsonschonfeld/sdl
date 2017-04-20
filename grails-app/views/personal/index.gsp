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
                <div>
                    <md-checkbox aria-label="Select All"
                                 ng-checked="isCheckedActive(misPers  | filter:'true')"
                                 md-indeterminate="isIndeterminateActive(misPers  | filter:'true')"
                                 ng-click="toggleAllActive(misPers  | filter:'true')">
                        Seleccionar Todos
                    </md-checkbox>
                    <button ng-show="allChekedActive" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" ng-click="inactiveAllPersonals(misPers | filter:'true',true, $event)">
                        <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_swap_horiz_black_18px.svg')}" class="s24" aria-label="Cake"></md-icon>
                    </button>
                </div>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in misPers | filter:'true' | orderBy:'cargo.id'"
                      class="noright md-2-line" >
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_outline_black_18px.svg')}"
                 class="md-avatar"/>

            <div class="md-list-item-text">
                <h3><b ng-show="findPersonalCargo(${cargos}, personal.cargo.id)"><u>{{personalCargo.name}}:</u></b> {{personal.surname}} {{personal.name}} </h3>
                <h4 ng-show="personal.dateBorn"><b>Nacimiento:</b> {{personal.dateBorn | date : "dd/MM/yyyy"}} <b ng-show="personal.phone">Telefono:</b> {{personal.phone}}</h4>
                <p> <b ng-show="personal.cuil">Cuil:</b>{{personal.cuil}} <b ng-show="personal.addres"> Direccion:</b> {{personal.addres}} <b ng-show="personal.email"> Correo:</b> {{personal.email}} </p>
            </div>
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
                <b>Personales Desactivos</b>
                <div>
                    <md-checkbox aria-label="Select All"
                                 ng-checked="isCheckedInactive(misPers | filter:'false')"
                                 md-indeterminate="isIndeterminateInactive(misPers | filter:'false')"
                                 ng-click="toggleAllInactive(misPers | filter:'false')">
                        Seleccionar Todos
                    </md-checkbox>
                    <button ng-show="allChekedInactive" class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored" ng-click="inactiveAllPersonals(misPers | filter:'false', false, $event)">
                        <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_swap_horiz_black_18px.svg')}" class="s24" aria-label="Cake"></md-icon>
                    </button>
                    </div>
            </div>
        </md-subheader>
        <md-list-item ng-repeat="personal in misPers | filter:'false' | orderBy:'surname'"
                      class="noright md-3-line">
            <img alt="{{personal.name}}"
                 ng-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"
                 class="md-avatar"/>

            <div class="md-list-item-text">
                <h3><b ng-show="findPersonalCargo(${cargos}, personal.cargo.id)"><u>{{personalCargo.name}}:</u></b> {{personal.surname}} {{personal.name}} </h3>
                <h4 ng-show="personal.dateBorn"><b>Nacimiento:</b> {{personal.dateBorn | date : "dd/MM/yyyy"}} <b ng-show="personal.phone">Telefono:</b> {{personal.phone}}</h4>
                <p> <b ng-show="personal.cuil">Cuil:</b>{{personal.cuil}} <b ng-show="personal.addres"> Direccion:</b> {{personal.addres}} <b ng-show="personal.email"> Correo:</b> {{personal.email}} </p>
            </div>
            <md-checkbox class="md-secondary" ng-checked="existsInactive(personal.id, selectedInactive)"
                         ng-click="toggleInactive(personal.id, selectedInactive)" aria-label="Check"></md-checkbox>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_update_black_18px.svg')}"
                     ng-click="updatePersonal(personal)" aria-label="Modificar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_delete_forever_black_18px.svg')}"
                     ng-click="deletePersonal(personal, $event)" aria-label="Eliminar" class="md-secondary"></md-icon>
            <md-icon md-svg-icon="${resource(dir: 'images', file: 'angularMaterial/ic_swap_horiz_black_18px.svg')}"
                     ng-click="inactivePersonal(personal, $event)" aria-label="Act Desact" class="md-secondary"></md-icon>
            <md-divider ></md-divider>
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