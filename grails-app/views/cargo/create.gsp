<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 02/03/17
  Time: 10:59
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
    <head>
        <meta name="layout" content="page"/>
        <title>Nuevo Cargo</title>
        <g:set var="formLayout"  value="Nuevo Cargo" scope="request"/>
    </head>

    <body>
    <g:if test="${flash.error}">
        <md-toolbar class="md-warn">
            <div class="md-toolbar-tools">
                <div class="alert alert-error" style="display: block">${flash.error}</div>
            </div>
        </md-toolbar>

    </g:if>
    <g:if test="${flash.message}">
        <md-toolbar class="md-successful">
            <div class="md-toolbar-tools">
                <div class="message" style="display: block">${flash.message}</div>
            </div>
        </md-toolbar>
    </g:if>

    <g:form controller="cargo" action="save" name="formNewCargo">
            <md-input-container class="md-icon-float md-block" >
                <!-- Use floating label instead of placeholder -->
                <label>Nombre</label>
                <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" ></md-icon>
                <input  name="name" type="text" required ng-model="name" minlength="4"/>
                <div ng-messages="formNewCargo.name.$error" role="alert">
                    <div ng-message="required">Nombre es requerido.</div>
                    <div ng-message-exp="['minlength']">
                        Nombre debe poseer como minimo 4 letras
                    </div>
                </div>
            </md-input-container>
            <md-input-container class="md-icon-float md-block" >
                <!-- Use floating label instead of placeholder -->
                <label>Descripcion</label>
                <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_description_black_24px.svg')}"></md-icon>
                <input type="text" name="description" ng-model="description">
                <div ng-messages="formNewCargo.description.$error" role="alert">
                </div>
            </md-input-container>
            <button class="mdl-button mdl-button--raised mdl-button--colored " type="submit" >Guardar</button>
    </g:form>
    </body>
</html>