var csinc = angular.module('csinc', ['ngRoute', 'ngSanitize', 'csinc.resources.posts']);

csinc.config(['$routeProvider', function ($routeProvider) {
   $routeProvider.when('/home', { templateUrl: '/app/views/home.html' })
   $routeProvider.when('/about', { templateUrl: '/app/views/about.html' })
   $routeProvider.when('/contact', { templateUrl: '/app/views/contact.html' })
   $routeProvider.when('/blog', { templateUrl: '/app/views/blog.html', controller: 'BlogCtrl' })
   $routeProvider.when('/blog/posts/:year/:month/:slug', { templateUrl: '/app/views/post.html', controller: 'PostCtrl' })
   .otherwise({ redirectTo: '/home' });
}]);

csinc.controller('AppCtrl', ['$scope', '$location', function ($scope, $location, Posts) { 
        $scope.page = 'home';

        $scope.setPage = function (page) {$scope.page = page;};
        $scope.getDateArray = function(postDate) {
            var ar = postDate.substring(0, postDate.indexOf('T')).split('-');
            return ar;
        };
        $scope.getLink = function (post) {
            var ar = $scope.getDateArray(post.published_on);            
            return '/#/blog/posts/' + ar[0] + '/' + ar[1] + '/' + post.slug;
        };
        $scope.isActive = function(path) {
            console.log($location.$$path);
            return $location.$$path.substring(0,path.length) == path;
        };

        (function init() { 
            // console.log('init AppCtrl');
        })(); 
    }]);

csinc.controller('BlogCtrl', ['$scope', 'Posts', function ($scope, Posts) { 
        $scope.list = [];

        $scope.trimmedBody = function(body) {
            if(!body || body.length == 0) {return '{empty}';}
            var str = body.replace(/(<[^>]*>)|\n|\t/g,'');
            
            if(str.length < 200) {return str;}
            return str.substring(0,198) + '..';
        };

        (function init() { 
            // console.log('init BlogCtrl');
            Posts.list(1, function(data) {
                $scope.list = data;
            });
        })(); 
    }]);

csinc.controller('PostCtrl', ['$scope', '$routeParams', 'Posts', function ($scope, $routeParams, Posts) { 
        $scope.post = {};
        $scope.slug = '';
        $scope.monthNames = [ "January", "February", "March", "April", "May", "June", 
            "July", "August", "September", "October", "November", "December" ];

        $scope.formatDate = function(dt) {
            if(!dt) {return '';}
            var ar = dt.substring(0, dt.indexOf('T')).split('-');
            return ar[2] + ' ' + $scope.monthNames[parseInt(ar[1])] + ' ' + ar[0];
        };

        (function init() { 
            // console.log('init PostCtrl');
            $scope.slug = typeof($routeParams.slug) == "undefined" ? 'slug' : $routeParams.slug;
            Posts.get($scope.slug, function(data) {
                $scope.post = data;
            });
        })(); 
    }]);