app.factory('Categories', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('categories.json').success(function(data){
        callback(data);
      })
    }
  }
}]);

app.factory('Items', ['$http', function($http){
  return {
    get: function(callback){
      $http.get('items.json').success(function(data){
        callback(data);
      })
    }
  }
}]);
