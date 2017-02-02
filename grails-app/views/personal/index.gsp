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
    <style>
    .mdl-card {
        width: 50%;
        margin: auto;
        margin-top: 1%;
        margin-bottom: 1%;
    }
    .mdl-card > .mdl-card__title {
        color: #ef6c00;
        height: 176px;
        background: url('http://tfirdaus.github.io/mdl/images/laptop.jpg') center / cover;
    }
    </style>
</head>

<body>
<div class="mdl-card mdl-typography--text-center mdl-shadow--16dp">
    <div class="mdl-card__title">
        <h2 class="mdl-card__title-text">Nuevo Personal</h2>
    </div>
    <div class="mdl-card__supporting-text">
        <form action="index.gsp" id="formNewPersonal">
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" pattern="[0-9]{8,8}" id="dni">
                <label class="mdl-textfield__label" for="dni">DNI...</label>
                <span class="mdl-textfield__error">Por favor, Debe ser solo 8 (ocho) numero sin puntos!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)+(\s*[a-zA-Z]*)" id="name" />
                <label class="mdl-textfield__label" for="name">Nombre</label>
                <span class="mdl-textfield__error">Por favor, debe ser solo letras!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" pattern="[a-zA-Z]+(\s*[a-zA-Z]*)+(\s*[a-zA-Z]*)" id="username" />
                <label class="mdl-textfield__label" for="username">Apellido</label>
                <span class="mdl-textfield__error">Por favor, debe ser solo letras!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="date" id="dateBorn">
                <label class="mdl-textfield__label" for="dateBorn">Fecha de Nacimiento...</label>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" id="addres">
                <label class="mdl-textfield__label" for="addres">Direccion...</label>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" pattern="[0-9]{8,8}" id="cellPhone">
                <label class="mdl-textfield__label" for="cellPhone">Celular...</label>
                <span class="mdl-textfield__error">Por favor, Debe ser solo 8 (ocho) numero sin puntos!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="text" pattern="[0-9]*" id="phone">
                <label class="mdl-textfield__label" for="phone">Telefono...</label>
                <span class="mdl-textfield__error">Por favor, Debe ser solo numeros!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label">
                <input class="mdl-textfield__input" type="se" id="cargo">
                <label class="mdl-textfield__label" for="cargo">Cargo...</label>
                <span class="mdl-textfield__error">Por favor, Debe ser solo 8 (ocho) numero sin puntos!</span>
            </div>
            <div class="mdl-layout-spacer"></div>
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--floating-label getmdl-select getmdl-select__fix-height">
                <input class="mdl-textfield__input" type="text" id="sample2" value="Belarus" readonly tabIndex="-1">
                <label for="sample2">
                    <i class="mdl-icon-toggle__label material-icons">keyboard_arrow_down</i>
                </label>
                <label for="sample2" class="mdl-textfield__label">Country</label>
                <ul for="sample2" class="mdl-menu mdl-menu--bottom mdl-js-menu">
                    <li class="mdl-menu__item" data-val="DE">Germany</li>
                    <li class="mdl-menu__item" data-val="BY">Belarus</li>
                    <li class="mdl-menu__item" data-val="RU">Russia</li>
                </ul>
            </div>
        </form>
    </div>
    <div class="mdl-card__actions mdl-card--border mdl-shadow--16dp">
        <button class="mdl-button mdl-button--raised mdl-button--accent" type="reset">Cancelar</button>
        <button class="mdl-button mdl-button--raised mdl-button--colored " type="submit" >Guardar</button>
    </div>
    <div class="mdl-card__menu">
    </div>
</div>
</body>
</html>