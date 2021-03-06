// Controllers
app.controller('ItemController', function($scope, $route, $location, $http, Items){
  Items.get(function(response){
    $scope.items = response;
  });
})

app.controller('ListController', function($scope, $route, $location, $http, Categories){
  $scope.selection = [];
  Categories.get(function(response){
    $scope.categories = response;
    angular.forEach($scope.categories, function(location, key){
      $scope.selection.push(location.id);
    });
  });

  $scope.sendCategory = function(category) {
     $scope.search = category.id;
  };

  $scope.resetSearch = function () {
    $scope.search = '';
  }

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

app.controller('CategoryController', function($scope, $route, $location, $http, Categories){
  Categories.get(function(response){
    $scope.categories = response;
  });
});
