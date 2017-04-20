<form name="formNewPersonal" ng-submit="submitForm(formData, formNewPersonal.$valid)" novalidate>

    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <!-- Use floating label instead of placeholder -->
            <label>Nombre</label>
            <md-icon
                    md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"></md-icon>
            <input name="name" type="text" required ng-model="formData.name"/>

            <div ng-messages="formNewPersonal.name.$error" role="alert">
                <div ng-message="required">Nombre es requerido.</div>
            </div>
        </md-input-container>
        <md-input-container class="md-icon-float md-block" flex="50">
            <!-- Use floating label instead of placeholder -->
            <label>Apellido</label>
            <md-icon
                    md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}"></md-icon>
            <input required type="text" name="surname" ng-model="formData.surname">

            <div ng-messages="formNewPersonal.surname.$error" role="alert">
                <div ng-message="required">Apellido es requerido.</div>
            </div>
        </md-input-container>
    </div>

    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>Correo</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_email_black_24px.svg')}"></md-icon>
            <input type="email" name="email" ng-model="formData.email"
                   minlength="10" maxlength="30" ng-pattern="/^.+@.+\..+$/"/>

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
            <label>F. Nacimiento</label>
            <md-datepicker name="dateBorn" ng-model="formData.dateBorn" md-current-view="year" md-max-date="maxDate"
                           required></md-datepicker>

            <div ng-messages="formNewPersonal.dateBorn.$error" role="alert">
                <div ng-message="required">La Fecha de Nacimiento es requerida.</div>
            </div>
        </md-input-container>
    </div>

    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>CUIL - ##-########-#</label>
            <md-icon
                    md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_assignment_ind_black_24px.svg')}"></md-icon>
            <input name="cuil" required ng-model="formData.cuil" ng-pattern="/^[0-9]{2}-[0-9]{8}-[0-9]{1}$/"/>

            <div ng-messages="formNewPersonal.cuil.$error" role="alert">
                <div ng-message-exp="['pattern']">##-########-# - Por favor, CUIL debe ser valido.</div>

                <div ng-message="required">CUIL es requerido.</div>
            </div>
        </md-input-container>
        <md-input-container flex="50">
            <label>Direccion</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_home_black_24px.svg')}"></md-icon>
            <input required type="text" name="addres" ng-model="formData.addres">

            <div ng-messages="formNewPersonal.addres.$error" role="alert">
                <div ng-message="required">Direccion es requerido.</div>
            </div>
            <span ng-show="formNewPersonal.addres.$touched && formNewPersonal.addres.$invalid">The name is required.</span>
        </md-input-container>
    </div>

    <div layout="row">
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>Telefono</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_phone_black_24px.svg')}"></md-icon>
            <input type="number" name="phone" ng-model="formData.phone" minlength="10" maxlength="13"/>

            <div ng-messages="formNewPersonal.phone.$error" role="alert">
                <div ng-message-exp="['minlength', 'maxlength']">
                    El telefono debe contener entre 10 y 13 digitos.
                </div>
            </div>
        </md-input-container>
        <md-input-container class="md-icon-float md-block" flex="50">
            <label>Cargo</label>
            <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_work_black_24px.svg')}"></md-icon>
            <md-select required name="cargo" ng-model="formData.cargo">
                <md-option ng-repeat="cargo in ${cargos}" value="{{cargo.id}}">{{cargo.name}}</md-option>
            </md-select>

            <div ng-messages="formNewPersonal.cargo.$error" role="alert">
                <div ng-message="required">Cargo es requerido.</div>
            </div>
        </md-input-container>
    </div>
    <button class="mdl-button mdl-button--raised" ng-click="reset()" type="button">Cancelar</button>
    <button type="submit" class="mdl-button mdl-button--raised mdl-button--colored "
            ng-disabled="formNewPersonal.$invalid || formNewPersonal.$pristine">Guardar</button>
</form>