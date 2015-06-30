var sssApp = angular.module('sssApp', ['ngRoute', 'myApp']);

sssApp.factory('Ssses', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('ssses.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

sssApp.factory('Categories', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('categories.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

sssApp.factory('SssCategories', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('sss_categories.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

// Config and Routes 
sssApp.config(['$routeProvider', function($routeProvider){
  $routeProvider
    .when('/ssses', {
        templateUrl:"/templates/sss/index.html"
    })
    .when('/ssses/:id', {
        templateUrl:"show.html"
    });
  }
]);

sssApp.filter('filterWithOr', function ($filter) {
  var comparator = function (actual, expected) {
    if (angular.isUndefined(actual)) {
      // No substring matching against `undefined`
      return false;
    }
    if ((actual === null) || (expected === null)) {
      // No substring matching against `null`; only match against `null`
      return actual === expected;
    }
    if ((angular.isObject(expected) && !angular.isArray(expected)) || (angular.isObject(actual) && !hasCustomToString(actual))) {
      // Should not compare primitives against objects, unless they have custom `toString` method
      return false;
    }

    actual = angular.lowercase('' + actual);
    if (angular.isArray(expected)) {
      var match = false;
      expected.forEach(function (e) {
        e = angular.lowercase('' + e);
        if (actual.indexOf(e) !== -1) {
          match = true;
        }
      });
      return match;
    } else {
      expected = angular.lowercase('' + expected);
      return actual.indexOf(expected) !== -1;
    }
  };
  return function (campaigns, filters) {
    return $filter('filter')(campaigns, filters, comparator);
  };
});

sssApp.controller('ListController', function($scope, $route, $location, $http, Categories){
  $scope.selection = [];
  Categories.get(function(response){
    $scope.categories = response;
    angular.forEach($scope.categories, function(location, key){
      $scope.selection.push(location.id);
    });
  });
  
  $scope.sendCategory = function(category) {
    // How can I pass this value to ItemController?
     $scope.search =category.id;
  };
   
  $scope.sort = function(item) {
    if ($scope.orderProp == 'date') {
      return new Date(item.date);
    }
      return item[$scope.orderProp];
  };

  // toggle selection for a given fruit by name
  $scope.toggleSelection = function toggleSelection(category) {
    var idx = $scope.selection.indexOf(category);
    if (idx > -1) {
      $scope.selection.splice(idx, 1);
    }
    // is newly selected
    else {
      $scope.selection.push(category);
    }
  };
});

myApp.controller('CategoryController', function($scope, $route, $location, $http, Categories){
  Categories.get(function(response){
    $scope.categories = response;
  });
});

myApp.controller('SssController', function($scope, $route, $location, $http, Ssses, SssCategories){
  
  Ssses.get(function(response){
    $scope.ssses = response;
  });

  SssCategories.get(function(response){
    $scope.sss_categories = response;
    console.log($scope.sss_categories);
  });
  
  // Update this value dynamically - onclick
  $scope.filters = "";

  $scope.viewDetail = function(item) {
    $location.path('/item/' + item.id);
  }

  $scope.item = {
    categories: []
  }

});
