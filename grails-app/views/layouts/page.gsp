<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19/12/16
  Time: 14:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<head>
    <g:meta name="viewport" content="width=device-width, initial-scale=1.0"></g:meta>
    <title><g:layoutTitle default="SDL - Sistema de Liquidacion"/></title>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesign/material.green-orange.min.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesign/material.min.css.map')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesign/select/getmdl-select.min.css.map')}"/>
    <script src="${resource(dir: 'js', file: 'angular/angular.min.js')}"></script>
    <script defer src="${resource(dir: 'js', file: 'materialDesign/material.min.js')}"></script>
    <script defer src="${resource(dir: 'js', file: 'materialDesign/material.min.js.map')}"></script>
    <script defer src="${resource(dir: 'js', file: 'materialDesign/select/getmdl-select.min.js')}"></script>
    <script defer src="${resource(dir: 'js', file: 'materialDesign/select/getmdl-select.min.js.map')}"></script>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>
    <g:layoutHead/>
    <r:layoutResources />
</head>
<body ng-app="">

<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header">
    <!--Header -->
    <header class="mdl-layout__header">
        <div class="mdl-layout__header-row">
            <!-- Title -->
            <span class="mdl-layout-title">Sistema de Liquidación</span>
            <!-- Add spacer, to align navigation to the right -->
            <div class="mdl-layout-spacer"></div>
            <!-- Navigation. We hide it in small screens. -->
            <nav class="mdl-navigation mdl-layout--large-screen-only">
            <a href="${createLink(uri: '/')}"><button class="mdl-button mdl-js-button mdl-button--accent">Inicio</button></a>
            <a href="personal"><button class="mdl-button mdl-js-button mdl-button--accent">Personal</button></a>
            <a href="cargo"><button class="mdl-button mdl-js-button mdl-button--accent">Cargo</button></a>
            <a href="liquidacion"><button class="mdl-button mdl-js-button mdl-button--accent">Liquidación</button></a>
            <a href="contacto"><button class="mdl-button mdl-js-button mdl-button--accent">Contacto</button></a>
            <!-- Accent-colored flat button -->
            <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">add</i>
            </button>
            </nav>
            <!-- Search -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                  mdl-textfield--floating-label mdl-textfield--align-right">
                <label class="mdl-button mdl-js-button mdl-button--icon"
                       for="fixed-header-drawer-exp">
                    <i class="material-icons">search</i>
                </label>
                <div class="mdl-textfield__expandable-holder">
                    <input class="mdl-textfield__input" type="text" name="sample"
                           id="fixed-header-drawer-exp">
                </div>
            </div>
        </div>
    </header>
    <!--Menu -->
    <div class="demo-drawer mdl-layout__drawer mdl-color-text--blue-grey-50">
        <header class="demo-drawer-header">

            <div class="demo-avatar-dropdown mdl-color--orange-400">
                <img src="images/grails_logo.png" class="demo-avatar">
                <span>hello@example.com</span>
                <div class="mdl-layout-spacer"></div>
            </div>
        </header>
        <nav class="demo-navigation mdl-navigation ">
            <g:link class="mdl-navigation__link" ></g:link>
            <a class="mdl-navigation__link" href="${createLink(uri: '/')}"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Inicio</a>
            <a class="mdl-navigation__link" href="personal"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">perm_identity</i>Personal</a>
            <a class="mdl-navigation__link" href="cargo"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">assignment_turned_in</i>Cargo</a>
            <a class="mdl-navigation__link" href="liquidacion"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">content_paste</i>Liquidacion</a>
            <a class="mdl-navigation__link" href="contacto"><i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">contacts</i>Contactos</a>
        </nav>
    </div>
    <!--Main or Body -->
    <main class="mdl-layout__content">
        <div class="page-content">
            <g:layoutBody/>
        </div>
    </main>
    <!--Footer -->
    <footer class="mdl-mini-footer">
        <div class="mdl-logo">SDL - Sistema de Liquidacion</div>
        <div class="mdl-mini-footer__right-section">
            <ul class="mdl-mini-footer__link-list">
                <li><a href="#">Inicio</a></li>
                <li><a href="#">Contacto</a></li>
            </ul>
        </div>
    </footer>
</div>
<r:layoutResources />
</body>
</html>