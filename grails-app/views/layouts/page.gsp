<%--
  Created by IntelliJ IDEA.
  User: root
  Date: 19/12/16
  Time: 14:43
--%>

<%@ page contentType="text/html;charset=UTF-8" %>
<html >
<head>
    <g:meta name="viewport" content="width=device-width, initial-scale=1.0"></g:meta>
    <title><g:layoutTitle default="SDL - Sistema de Liquidacion"/></title>

    <!-- Angular Material requires Angular.js Libraries -->
    <script src="${resource(dir: 'js', file: 'angular/angular.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'angular/angular-animate.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'angular/angular-aria.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'angular/angular-messages.min.js')}"></script>
    <script src="${resource(dir: 'js', file: 'angular/angular-route.min.js')}"></script>

    <!-- Angular Material Lite Library -->
    <script defer src="${resource(dir: 'js', file: 'materialDesignLite/material.min.js')}"></script>
    <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesignLite/material.green-orange.min.css')}"/>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesignLite/card.css')}"/>

    <!-- Angular Material Library-->
    <script defer src="${resource(dir: 'js', file: 'materialDesign/angular-material.min.js')}"></script>
    <link rel="stylesheet" href="${resource(dir: 'css', file: 'materialDesign/angular-material.min.css')}"/>

    <link rel="shortcut icon" href="${resource(dir: 'images', file: 'favicon.ico')}" type="image/x-icon"/>

    <script defer src="${resource(dir: 'js', file: 'angularApp.js')}"></script>

    <g:layoutHead/>
    <r:layoutResources />
</head>
<body  ng-app="sdlApp" ng-cloak="">

<!-- Always shows a header, even in smaller screens. -->
<div class="mdl-layout mdl-js-layout mdl-layout--fixed-header" >
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
            <md-menu>
                <md-button class="mdl-button mdl-js-button mdl-button--accent" ng-click="$mdMenu.open()">
                    Personal
                </md-button>
                <md-menu-content width="2" ng-mouseleave="$mdMenu.close()">
                    <md-menu-item><a href="${createLink(uri: '/personal')}"><md-button>Listado</md-button></a></md-menu-item>
                    <md-menu-item><a href="${createLink(uri: '/personal/create')}"><md-button>Crear</md-button></a></md-menu-item>
                </md-menu-content>
            </md-menu>
            <md-menu>
                <md-button class="mdl-button mdl-js-button mdl-button--accent" ng-click="$mdMenu.open()">
                    Cargo
                </md-button>
                <md-menu-content width="2" ng-mouseleave="$mdMenu.close()">
                    <md-menu-item><a href="${createLink(uri: '/cargo')}"><md-button>Listado</md-button></a></md-menu-item>
                    <md-menu-item><a href="${createLink(uri: '/cargo/create')}"><md-button>Crear</md-button></a></md-menu-item>
                </md-menu-content>
            </md-menu>
            <a href="${createLink(uri: '/liquidacion')}"><button class="mdl-button mdl-js-button mdl-button--accent">Liquidación</button></a>
            <a href="${createLink(uri: '/contacto')}"><button class="mdl-button mdl-js-button mdl-button--accent">Contacto</button></a>

            <!-- Accent-colored flat button
            <button class="mdl-button mdl-js-button mdl-button--fab mdl-button--mini-fab mdl-button--colored">
                <i class="material-icons">add</i>
            </button>-->
            </nav>
            <!-- Search -->
            <div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable
                  mdl-textfield--floating-label mdl-textfield--align-right">
                <label class="mdl-button mdl-js-button mdl-button--icon"
                       for="fixed-header-drawer-exp">
                    <md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_search_black_18px.svg')}" class="s18" aria-label="Search"></md-icon>
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
                <img src="${resource(dir: 'images', file: 'angularMaterial/ic_person_black_24px.svg')}" class="demo-avatar">
                <span>hello@example.com</span>
                <div class="mdl-layout-spacer"></div>
            </div>
        </header>
        <nav class="demo-navigation mdl-navigation ">
            <md-toolbar class="md-menu-toolbar">
                <md-menu-bar>
                    <md-button ng-href="${createLink(uri: '/')}"><md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_home_black_24px.svg')}" aria-label="Inicio"></md-icon>Inicio</md-button>
                    <md-menu>
                        <md-button ng-click="$mdMenu.open()"><md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_group_black_18px.svg')}" aria-label="Personal"></md-icon>Personal</md-button>
                        <md-menu-content width="2">
                            <md-menu-item><md-button ng-href="${createLink(uri: '/personal')}">Listado</md-button></md-menu-item>
                            <md-menu-item><md-button ng-href="${createLink(uri: '/personal/create')}">Crear</md-button></md-menu-item>
                        </md-menu-content>
                    </md-menu>
                    <md-menu>
                        <md-button ng-click="$mdMenu.open()"><md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_work_black_18px.svg')}" aria-label="Cargo"></md-icon>Cargo</md-button>
                        <md-menu-content width="2">
                            <md-menu-item><md-button ng-href="${createLink(uri: '/cargo')}">Listado</md-button></md-menu-item>
                            <md-menu-item><md-button ng-href="${createLink(uri: '/cargo/create')}">Crear</md-button></md-menu-item>
                        </md-menu-content>
                    </md-menu>
                    <md-button ng-href="${createLink(uri: '/liquidacion')}"><md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_description_black_24px.svg')}" aria-label="Liquidacion"></md-icon>Liquidación</md-button>
                    <md-button ng-href="${createLink(uri: '/contacto')}"><md-icon md-svg-src="${resource(dir: 'images', file: 'angularMaterial/ic_contact_phone_black_18px.svg')}" aria-label="Contacto"></md-icon>Contacto</md-button>
                </md-menu-bar>
            </md-toolbar>
        </nav>
    </div>
    <!--Main or Body -->
    <main class="mdl-layout__content">
        <div class="page-content">
            <g:if test="${formLayout}">
                <div class="mdl-card mdl-typography--text-center mdl-shadow--16dp">
                <div class="mdl-card__title">
                    <h2 class="mdl-card__title-text">${formLayout}</h2>
                </div>
                <div class="mdl-card__supporting-text">
            </g:if>

            <g:layoutBody/>

            <g:if test="${formLayout}">
                </div>
                <div class="mdl-card__actions mdl-card--border mdl-shadow--16dp">

                </div>
                <div class="mdl-card__menu">
                </div>
                </div>
            </g:if>
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