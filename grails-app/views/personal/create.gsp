<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 03/01/17
  Time: 16:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <meta name="layout" content="page"/>
    <title>Nuevo Personal</title>
    <g:set var="formLayout"  value="Nuevo Personal" scope="request"/>
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

    <g:form controller="personal" action="save" name="formNewPersonal">
    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <!-- Use floating label instead of placeholder -->
            <label>Nombre</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" ></md-icon>
            <input  name="name" type="text" required ng-model="name"/>
            <div ng-messages="formNewPersonal.name.$error" role="alert">
                <div ng-message="required">Nombre es requerido.</div>
            </div>
        </md-input-container>
        <md-input-container class="md-icon-float md-block" flex="50" >
            <!-- Use floating label instead of placeholder -->
            <label>Apellido</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"></md-icon>
            <input required type="text" name="surname" ng-model="surname">
            <div ng-messages="formNewPersonal.surname.$error" role="alert">
                <div ng-message="required">Apellido es requerido.</div>
            </div>
        </md-input-container>
    </div>
    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>Correo</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_email_black_24px.svg')}" ></md-icon>
            <input type="email" name="email" ng-model="email"
                   minlength="10" maxlength="30" ng-pattern="/^.+@.+\..+$/" />
            <div ng-messages="formNewPersonal.email.$error" role="alert">
                <div ng-message-exp="['pattern']">
                    El correo debe ser valido.
                </div>
                <div ng-message-exp="['minlength', 'maxlength']">
                    El correo debe poseer entre 10 y 30 caracteres.
                </div>
            </div>
        </md-input-container>
        <md-input-container class="md-icon-float md-block" flex="50">
            <!-- Use floating label instead of placeholder -->
            <label>Fecha de Nacimiento - dd/mm/aaaa</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_date_range_black_24px.svg')}" ></md-icon>
            <input  name="dateBorn" required ng-model="dateBorn"  ng-pattern="/^[0-9]{2}/[0-9]{2}/[0-9]{4}$/" />
            <div ng-messages="formNewPersonal.dateBorn.$error" role="alert">
                <div ng-message-exp="['pattern']">dd/mm/aaaa - Por favor,La Fecha de Nacimiento debe ser valida.</div>
                <div ng-message="required">La Fecha de Nacimiento es requerida.</div>
            </div>
        </md-input-container>
    </div>
    <div layout="row">
        <md-input-container  class="md-icon-float md-block" flex="50">
            <label>CUIL - ##-########-#</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_assignment_ind_black_24px.svg')}" ></md-icon>
            <input  name="cuil" required ng-model="cuil"  ng-pattern="/^[0-9]{2}-[0-9]{8}-[0-9]{1}$/" />
            <div ng-messages="formNewPersonal.cuil.$error" role="alert">
                <div ng-message-exp="['pattern']">##-########-# - Por favor, CUIL debe ser valido.</div>
                <div ng-message="required">CUIL es requerido.</div>
            </div>
        </md-input-container>
        <md-input-container flex="50">
            <label>Direccion</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_home_black_24px.svg')}" ></md-icon>
            <input required type="text" name="addres" ng-model="addres">
            <div ng-messages="formNewPersonal.addres.$error" role="alert">
                <div ng-message="required">Direccion es requerido.</div>
            </div>
        </md-input-container>
    </div>
    <div layout="row">
        <md-input-container class="md-icon-float md-block"  flex="50">
            <label>Telefono</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_phone_black_24px.svg')}"></md-icon>
            <input type="number" name="phone" ng-model="phone" minlength="10" maxlength="13"/>
            <div ng-messages="formNewPersonal.phone.$error" role="alert">
                <div ng-message-exp="['minlength', 'maxlength']">
                    El telefono debe contener entre 10 y 13 digitos.
                </div>
            </div>
        </md-input-container>
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>Cargo</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_work_black_24px.svg')}" ></md-icon>
            <md-select required  name="cargo" ng-model="cargo">
                <md-option ng-repeat="cargo in ${cargos}"  value="{{cargo.id}}">{{cargo.name}}</md-option>
            </md-select>
            <div ng-messages="formNewPersonal.cargo.$error" role="alert">
                <div ng-message="required">Cargo es requerido.</div>
            </div>
        </md-input-container>
    </div>
            <!--<md-input-container flex="50">
            <md-switch name="active" class="md-warn">
                Personal Inactivo.
            </md-switch>
            </md-input-container>
            <md-input-container flex="50"> -->
        <button class="mdl-button mdl-button--raised mdl-button--colored " type="submit" >Guardar</button>
</g:form>
</body>
</html>