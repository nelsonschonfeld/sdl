/**
 * Created by root on 04/04/17.
 */
app.controller('listPersonalController', function($scope, $http) {

    //Active
    $scope.personalSelectedActive = [];
    $scope.selectedActive = [];

    $scope.toggleActive = function (personalSelectedActive, list) {
        var idx = list.indexOf(personalSelectedActive);
        if (idx > -1) {
            list.splice(idx, 1);
        }
        else {
            list.push(personalSelectedActive);
        }
    };

    $scope.existsActive = function (personalSelectedActive, list) {
        return list.indexOf(personalSelectedActive) > -1;
    };

    $scope.isIndeterminateActive = function() {
        return ($scope.selectedActive.length !== 0 &&
        $scope.selectedActive.length !== $scope.personalSelectedActive.length);
    };

    $scope.isCheckedActive = function() {
        return ($scope.selectedActive.length === $scope.personalSelectedActive.length) ;
    };

    $scope.toggleAllActive = function() {
        if ($scope.selectedActive.length === $scope.personalSelectedActive.length) {
            $scope.selectedActive = [];
        } else if ($scope.selectedActive.length === 0 || $scope.selectedActive.length > 0) {
            $scope.selected = $scope.personalSelectedActive.slice(0);
        }
    };
    //Inactive
    $scope.personalSelectedInactive = [];
    $scope.selectedInactive = [];

    $scope.toggleInactive = function (personalSelectedInactive, list) {
        var idx = list.indexOf(personalSelectedInactive);
        if (idx > -1) {
            list.splice(idx, 1);
        }
        else {
            list.push(personalSelectedInactive);
        }
    };

    $scope.existsInactive = function (personalSelectedInactive, list) {
        return list.indexOf(personalSelectedInactive) > -1;
    };

    $scope.isIndeterminateInactive = function() {
        return ($scope.selectedInactive.length !== 0 &&
        $scope.selectedInactive.length !== $scope.personalSelectedInactive.length);
    };

    $scope.isCheckedInactive = function() {
        return ($scope.selectedInactive.length === $scope.personalSelectedInactive.length) ;
    };

    $scope.toggleAllInactive = function() {
        if ($scope.selectedInactive.length === $scope.personalSelectedInactive.length) {
            $scope.selectedInactive = [];
        } else if ($scope.selectedInactive.length === 0 || $scope.selectedInactive.length > 0) {
            $scope.selectedInactive = $scope.personalSelectedInactive.slice(0);
        }
    };


    $scope.viewDetailsPersonal = function(personal) {
        alert("view" + personal.name)
    };

    $scope.deletePersonal = function(personal) {
        alert("delete")
    };

    $scope.updatePersonal = function(personal) {
        alert("update"  + personal.name)
    };

    $scope.inactivePersonal = function(personal) {
        alert("inactive " + personal.name)
    };

});