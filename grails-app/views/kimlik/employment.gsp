<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0-rc.2/angular.min.js"></script>
    <script src="http://code.angularjs.org/1.2.0-rc.2/angular-animate.min.js"></script>
    <script src="http://code.angularjs.org/1.0.8/angular-resource.min.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js"></script>
</head>

<body>
<div ng-controller='employmentController'>
    <g:render template="/kimlik/employmentEditable" model="[profile: profile]"></g:render>

    <r:script>var kimlik = angular.module('kimlik', ['ui.bootstrap', 'ngResource']);


function employmentController($scope, employmentService) {


    $scope.getEmploymentHistory = function () {
        return $scope.employment
    }

    $scope.addWork = function (work) {
        employmentService.addNew(work)
    }



}

kimlik.factory('employmentService', function ($resource, $rootScope) {
    $rootScope.employment = undefined  // work History

    function addNew(work) {
            var api = $resource('/employment/addNew');

              var params = work
              params.username = '${params.username}'
              if (work.startDate) params.startDate = new Date(work.startDate).valueOf()
              if (work.endDate) params.endDate = new Date(work.endDate).valueOf()
              console.log(work)
            api.save(params, {}, function (r) {
            fetchEmploymentHistory()
        });

    }

    function todo() {
        alert('todo')
    }

    function fetchEmploymentHistory() {
        var api = $resource('/employment/list');
        $rootScope.employment = api.query({username:'${params.username}'}, {});
    }

    fetchEmploymentHistory()
    return{
    addNew:addNew
    };
});
    </r:script>
</div>

</body>
</html>
