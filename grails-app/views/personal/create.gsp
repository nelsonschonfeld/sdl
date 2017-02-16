<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 03/01/17
  Time: 16:31
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<g:applyLayout name="layoutForm">
<head>
    <title>Nuevo Personal</title>

</head>

<body>
<g:form name="formNewPersonal">
    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <!-- Use floating label instead of placeholder -->
            <label>Nombre</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" class="name"></md-icon>
            <input  name="name" type="text" required />
            <div ng-messages="formNewPersonal.name.$error" role="alert">
                <div ng-message="required">Name is required.</div>
            </div>
        </md-input-container>

        <md-input-container class="md-icon-float md-block" flex="50" >
            <!-- Use floating label instead of placeholder -->
            <label>Apellido</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" class="md-contact-name"></md-icon>
            <input type="text" name="surname">
        </md-input-container>
    </div>
    <md-input-container class="md-block">
        <label>Correo</label>
        <input required type="email" name="email" ng-model="formNewPersonal.clientEmail"
               minlength="10" maxlength="100" ng-pattern="/^.+@.+\..+$/" />

        <div ng-messages="formNewPersonal.email.$error" role="alert">
            <div ng-message-exp="['required', 'minlength', 'maxlength', 'pattern']">
                El correo debe ser valido y poseer entre 10 y 100 caracteres.
            </div>
        </div>
    </md-input-container>
    <div layout="row">
        <md-input-container  class="md-icon-float md-block" flex="50">
            <label>Telefono</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_phone_black_24px.svg')}"></md-icon>
            <input type="number" name="phone"/>
        </md-input-container>
        <md-input-container flex="50">
            <label>Cargo</label>
            <md-select name="type" ng-model="project.type" required name="cargo">
                <md-option ng-repeat="cargo in [1,2,3]"  value="{{cargo}}">Cargo {{cargo}}</md-option>
            </md-select>
        </md-input-container>
    </div>
   <button class="mdl-button mdl-button--raised mdl-button--accent" type="reset">Cancelar</button>
   <button class="mdl-button mdl-button--raised mdl-button--colored " type="submit" >Guardar</button>
</g:form>
</body>
</g:applyLayout>
</html>