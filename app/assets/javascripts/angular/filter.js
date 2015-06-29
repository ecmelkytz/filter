var myApp = angular.module('myApp', ['ngRoute']);

myApp.factory('Items', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('items.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

myApp.factory('Categories', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('categories.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

// Config and Routes 
myApp.config(['$routeProvider', function($routeProvider){
  $routeProvider
		.when('/', {
				templateUrl:"templates/home.html"
		})
		.when('/item/:id', {
				templateUrl:"item.html"
		})
    .otherwise({
      redirectTo: '/'
      });
}]);

myApp.controller('headerController', function($scope, $location) {
  $scope.goHome = function () {
    $location.path('/');
  };
})

myApp.filter('filterWithOr', function ($filter) {
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

// Controllers
myApp.controller('ItemController', function($scope, $route, $location, $http, Items){
	
  Items.get(function(response){
    $scope.items = response;
  });
  
  // Update this value dynamically - onclick
  $scope.filters = "";

  $scope.viewDetail = function(item) {
		$location.path('/item/' + item.id);
	}

  $scope.item = {
    categories: []
  }

  $scope.checkAll = function() {
    $scope.item.categories = $scope.categories.map(function(item) { return item.id; });
  };

   $scope.uncheckAll = function() {
    $scope.item.categories = [];
  };
})	

myApp.controller('ListController', function($scope, $route, $location, $http, Categories){
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

myApp.controller('ItemDetailController', function($scope, $route, $location, $http, Items){
    Items.get(function(response){
    $scope.items = response; 
  
    if ($route.current.params.id) {
      angular.forEach($scope.items, function (v, k) {
        if (v.id == $route.current.params.id) {
          $scope.currItem = $scope.items[k];
          return false;
        }
      });
    }
  });
})



