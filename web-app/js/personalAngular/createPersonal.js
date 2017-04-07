/**
 * Created by root on 17/03/17.
 */
app.controller('createPersonalController', function($scope, $http) {
 var today = new Date();
    //$scope.maxDate = new Date(today.setYear(today.getYear()-15));
    $scope.messageError = null;
    $scope.messageSuccessful = null;

    $scope.maxDate = new Date(
        today.getFullYear()-15,
        today.getMonth(),
        today.getDate());

    $scope.formDataClear = {
        name : null,
        surname : null,
        dateBorn : null,
        cuil : null,
        addres :null,
        cargo : null
    };

    $scope.submitForm = function (formData, isValid) {
        //alert('Form submitted with' + JSON.stringify(formData));
        if (!isValid) {
            $scope.messageError = "Debe completar los campos requeridos";
            $scope.messageSuccessful = null;
        }else {
            $http({
                method: 'POST',
                url: 'save',
                data: formData, //forms user object
                headers: {'Content-Type': 'application/json'}
            }).then(function successCallback(response) {
                // this callback will be called asynchronously
                // when the response is available
                if (response.data.status == 201) {
                    $scope.messageSuccessful = response.data.message;
                    $scope.messageError = null;
                    $scope.reset();
                } else {
                    $scope.messageError = response.data.message;
                    $scope.messageSuccessful = null;
                }
            }, function (response) {
                // called asynchronously if an error occurs
                // or server returns response with an error status.
                $scope.messageError = "Error al crear el personal. Por favor contactese con el administrador.";
                $scope.messageSuccessful = null;
            });
        }
    };

    $scope.reset = function() {
        $scope.formData = angular.copy($scope.formDataClear);
        $scope.formNewPersonal.$setPristine();
        $scope.formNewPersonal.$setUntouched();
    };

});