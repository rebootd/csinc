var csinc = angular.module('csinc', ['ngRoute', 'csinc.resources.posts']);

csinc.config(['$routeProvider', function ($routeProvider) {
   $routeProvider.when('/home', { templateUrl: '/app/views/home.html' })
   $routeProvider.when('/about', { templateUrl: '/app/views/about.html' })
   $routeProvider.when('/contact', { templateUrl: '/app/views/contact.html' })
   $routeProvider.when('/blog', { templateUrl: '/app/views/blog.html', controller: 'BlogCtrl' })
   .otherwise({ redirectTo: '/home' });
}]);

csinc.controller('AppCtrl', ['$scope', 'Posts', function ($scope, Posts) { 
        (function init() { 
            console.log('init');
            // Posts.list(1, function(data) {
            //     console.log(JSON.stringify(data));
            // });
            // Posts.get('mongoid-and-csinc', function(data) {
            //     console.log(JSON.stringify(data));
            // });
        })(); 
    }]);

csinc.controller('BlogCtrl', ['$scope', 'Posts', function ($scope, Posts) { 
        (function init() { 
            console.log('init');
            // Posts.list(1, function(data) {
            //     console.log(JSON.stringify(data));
            // });
            // Posts.get('mongoid-and-csinc', function(data) {
            //     console.log(JSON.stringify(data));
            // });
        })(); 
    }]);