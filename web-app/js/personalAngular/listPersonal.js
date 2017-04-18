/**
 * Created by root on 04/04/17.
 */
app.controller('listPersonalController', function($scope, $http, $mdDialog, $filter, $mdToast) {

    //$scope.misPers = null;
    //Active
    $scope.selectedActive = [];
    $scope.allChekedActive = false;

    $scope.existsPersons = function (persAct) {
        return (persAct.length > 0)? true : false
    };

    $scope.toggleActive = function (id, list) {
        var idx = list.indexOf(id);
        if (idx > -1) {
            list.splice(idx, 1);
        }
        else {
            list.push(id);
        }
    };

    $scope.existsActive = function (id, list) {
        return list.indexOf(id) > -1;
    };

    $scope.isIndeterminateActive = function(persAct) {
        return ($scope.selectedActive.length !== 0 &&
        $scope.selectedActive.length !== persAct.length);
    };

    $scope.isCheckedActive = function(persAct) {
        return ($scope.selectedActive.length === persAct.length);
    };

    $scope.toggleAllActive = function(persAct) {
        $scope.allChekedActive = false;
        if ($scope.selectedActive.length === persAct.length) {
            $scope.selectedActive = [];
        } else if ($scope.selectedActive.length === 0 || $scope.selectedActive.length > 0) {
            persAct.forEach(function(item){
                if($scope.selectedActive.indexOf(item.id) === -1) {
                    $scope.selectedActive.push(item.id);
                }
            });
            $scope.allChekedActive = true;
        }
    };
    //Inactive
    $scope.selectedInactive = [];
    $scope.allChekedInactive = false;

    $scope.toggleInactive = function (id, list) {
        var idx = list.indexOf(id);
        if (idx > -1) {
            list.splice(idx, 1);
        }
        else {
            list.push(id);
        }
    };

    $scope.existsInactive = function (id, list) {
        return list.indexOf(id) > -1;
    };

    $scope.isIndeterminateInactive = function(persInact) {
        return ($scope.selectedInactive.length !== 0 &&
        $scope.selectedInactive.length !== persInact.length);
    };

    $scope.isCheckedInactive = function(persInact) {
        return ($scope.selectedInactive.length === persInact.length);
    };

    $scope.toggleAllInactive = function(persInact) {
        $scope.allChekedInactive = false;
        if ($scope.selectedInactive.length === persInact.length) {
            $scope.selectedInactive = [];
        } else if ($scope.selectedInactive.length === 0 || $scope.selectedInactive.length > 0) {
            persInact.forEach(function(item){
                if($scope.selectedInactive.indexOf(item.id) === -1) {
                    $scope.selectedInactive.push(item.id);
                }
            });
            $scope.allChekedInactive = true;
        }
    };


    $scope.viewDetailsPersonal = function(personal) {
        alert("detalles")
    };

    $scope.deletePersonal = function(personal, ev) {

        var confirm = $mdDialog.confirm()
            .title('Desea eliminar a '+ $filter('uppercase')(personal.name) + '?')
            .textContent($filter('uppercase')(personal.name) +' se borrará permanentemente.')
            .ariaLabel('Lucky day')
            .targetEvent(ev)
            .ok('Aceptar')
            .cancel('Cancelar');

        $mdDialog.show(confirm).then(function() {
            $http({
                method: 'POST',
                url: 'personal/delete',
                data: personal, //forms user object
                headers: {'Content-Type': 'application/json'}
            })
                .then(function successCallback(response) {
                    // this callback will be called asynchronously
                    // when the response is available
                    if (response.data.status == 201) {
                        $scope.messageSuccessful = response.data.message;
                        $scope.messageError = null;
                        $scope.misPers.splice($scope.misPers.indexOf(personal), 1);
                    } else {
                        $scope.messageError = response.data.message;
                        $scope.messageSuccessful = null;
                    }
                }, function (response) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.
                    $scope.messageError = 'Error al eliminar ' + $filter('uppercase')(personal.name) + '. Por favor contactese con el administrador.';
                    $scope.messageSuccessful = null;
                });
        }, function() {});
    };


    $scope.updatePersonal = function(personal, ev) {

        $scope.$parent.updateName = personal.surname + ", "+ personal.name;
        var today = new Date();
        $scope.$parent.maxDate = new Date(
            today.getFullYear()-15,
            today.getMonth(),
            today.getDate());

        $scope.$parent.formData = {
            name : personal.name,
            surname : personal.surname,
            email : personal.email,
            dateBorn : new Date(personal.dateBorn),
            cuil : personal.cuil,
            addres :personal.addres,
            phone: personal.phone,
            cargo : personal.cargo.id
        };

        $mdDialog.show({
            contentElement: '#myDialog',
            parent: angular.element(document.body),
            targetEvent: ev,
            clickOutsideToClose: true
        });
    };

    $scope.$parent.submitForm = function (formData, isValid, personal) {
        alert(personal);
        if (!isValid) {
            $scope.$parent.messageDialogError = "Debe completar los campos requeridos";
            $scope.$parent.messageDialogSuccessful = null;
        }else {
            $http({
                method: 'POST',
                url: 'personal/update',
                data: formData, //forms user object
                headers: {'Content-Type': 'application/json'}
            }).then(function successCallback(response) {
                // this callback will be called asynchronously
                // when the response is available
                if (response.data.status == 201) {
                    $scope.misPers.splice($scope.misPers.indexOf(personal), 1, response.data.persUpdated);
                    $scope.$parent.messageSuccessful = response.data.message;
                    $scope.$parent.messageError = null;
                    $scope.$parent.messageDialogError = null;
                    $scope.$parent.messageDialogSuccessful = null;
                    $scope.$parent.cancel()
                } else {
                    $scope.$parent.messageSuccessful = null;
                    $scope.$parent.messageError = null;
                    $scope.$parent.messageDialogError = response.data.message;
                    $scope.$parent.messageDialogSuccessful = null;
                }
            }, function (response) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.
                $scope.cancel()
                $scope.$parent.messageError = "Error al crear el personal. Por favor contactese con el administrador.";
                $scope.$parent.messageSuccessful = null;
                $scope.$parent.messageDialogError = null;
                $scope.$parent.messageDialogSuccessful = null;
            });
        }
    };

    $scope.inactivePersonal = function(personal, ev) {
        var confirm = $mdDialog.confirm()
            .title('Desea ' +(personal.active===true? 'Desactivar' : 'Activar') +' a '+ $filter('uppercase')(personal.name) + '?')
            .textContent($filter('uppercase')(personal.name) +' se '+(personal.active===true? 'desactivara.' : 'activara.') )
            .ariaLabel('Lucky day')
            .targetEvent(ev)
            .ok('Aceptar')
            .cancel('Cancelar');

        $mdDialog.show(confirm).then(function() {
            $http({
                method: 'POST',
                url: 'personal/inactive',
                data: personal, //forms user object
                headers: {'Content-Type': 'application/json'}
            })
                .then(function successCallback(response) {
                    // this callback will be called asynchronously
                    // when the response is available
                    if (response.data.status == 201) {
                        $scope.messageSuccessful = response.data.message;
                        $scope.messageError = null;
                        $scope.misPers.splice($scope.misPers.indexOf(personal), 1, response.data.persInact);
                    } else {
                        $scope.messageError = response.data.message;
                        $scope.messageSuccessful = null;
                    }
                }, function (response) {
                    // called asynchronously if an error occurs
                    // or server returns response with an error status.
                    $scope.messageError = 'Error al ' +(personal.active===true? 'Desactivar' : 'Activar') +' a '+ $filter('uppercase')(personal.name) +'. Por favor contactese con el administrador.';
                    $scope.messageSuccessful = null;
                });
        }, function() {});
    };

    $scope.$parent.cancel = function() {
       $mdDialog.cancel();
    };

});