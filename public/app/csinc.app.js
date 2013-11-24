var csinc = angular.module('csinc', ['csinc.resources.posts']);

// csinc.config(['$routeProvider', function ($routeProvider) {
//    $routeProvider.when('/home', { templateUrl: '/app/home.html' })
//    $routeProvider.when('/about', { templateUrl: '/app/about.html' })
//    $routeProvider.when('/contact', { templateUrl: '/app/contact.html' })
//    $routeProvider.when('/blog', { templateUrl: '/app/blog.html' })
//    .otherwise({ redirectTo: '/home' });
// }]);

csinc.controller('AppCtrl', ['$scope', '$rootScope', '$location', 'Posts', function ($scope, $rootScope, $location, Posts) { 
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
