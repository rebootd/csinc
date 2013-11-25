var csinc = angular.module('csinc', ['ngRoute', 'ngSanitize', 'wc.Directives', 'csinc.resources.posts']);

csinc.config(['$routeProvider', function ($routeProvider) {
   $routeProvider.when('/home', { title: 'home', templateUrl: '/app/views/home.html' })
   $routeProvider.when('/about', { title: 'about', templateUrl: '/app/views/about.html' })
   $routeProvider.when('/contact', { title: 'contact', templateUrl: '/app/views/contact.html' })
   $routeProvider.when('/blog', { title: 'blog', templateUrl: '/app/views/blog.html', controller: 'BlogCtrl' })
   $routeProvider.when('/blog/posts/:year/:month/:slug', { title: 'post', templateUrl: '/app/views/post.html', controller: 'PostCtrl' })
   .otherwise({ redirectTo: '/home' });
}]);

csinc.run(['$location', '$rootScope', function($location, $rootScope) {
    $rootScope.$on('$routeChangeSuccess', function (event, current, previous) {
        $rootScope.title = current.$$route.title;
    });
}]);

csinc.factory('DateService', ['$http', function ($http) {

        var DateService = {};
        DateService.monthNames = [ "January", "February", "March", "April", "May", "June", 
            "July", "August", "September", "October", "November", "December" ];
        DateService.formatDate = function(dt) {
            if(!dt) {return '';}
            var ar = dt.substring(0, dt.indexOf('T')).split('-');
            return ar[2] + ' ' + this.monthNames[parseInt(ar[1])] + ' ' + ar[0];
        };
        DateService.getDateArray = function(postDate) {
            var ar = postDate.substring(0, postDate.indexOf('T')).split('-');
            return ar;
        };

        return DateService;

    }]);

csinc.controller('AppCtrl', ['$scope', '$location', 'Posts', 'DateService', function ($scope, $location, Posts, DateService) { 
        $scope.page = 'home';

        $scope.$on('$viewContentLoaded', function(event) {
            setTimeout(function() {
                //console.log('#'+$location.$$path);
                clicky.log('#'+$location.$$path);
            }, 100);
        });

        $scope.setPage = function (page) {$scope.page = page;};
        $scope.getDateArray = function(postDate) {
            return DateService.getDateArray(postDate);
        };
        $scope.getLink = function (post) {
            var ar = $scope.getDateArray(post.published_on);            
            return '/#/blog/posts/' + ar[0] + '/' + ar[1] + '/' + post.slug;
        };
        $scope.isActive = function(path) {
            return $location.$$path.substring(0,path.length) == path;
        };

        (function init() { 
            // console.log('init AppCtrl');
        })(); 
    }]);

csinc.controller('BlogCtrl', ['$scope', 'Posts', 'DateService', function ($scope, Posts, DateService) { 
        $scope.list = [];
        $scope.currentPage = 1;
        $scope.hasMore = false;
        $scope.monthNames = [ "January", "February", "March", "April", "May", "June", 
            "July", "August", "September", "October", "November", "December" ];

        $scope.trimmedBody = function(body) {
            if(!body || body.length == 0) {return '{empty}';}
            var str = body.replace(/(<[^>]*>)|\n|\t/g,'');
            
            if(str.length < 200) {return str;}
            return str.substring(0,198) + '..';
        };

        $scope.prevPage = function() { 
            if($scope.currentPage==1) {return;} 
            $scope.currentPage--;
            Posts.list($scope.currentPage, function(data) {
                $scope.list = data;
                $scope.hasMore = $scope.list.length>0;
            });
        };
        $scope.nextPage = function() {
            if(!$scope.hasMore) {return;} 
            $scope.currentPage++;
            Posts.list($scope.currentPage, function(data) {
                $scope.list = data;
                $scope.hasMore = $scope.list.length>0;
            });
        };

        $scope.hasMoreItems = function() {return $scope.hasMore};

        $scope.formatDate = function(dt) {
            return DateService.formatDate(dt);
        };

        (function init() { 
            // console.log('init BlogCtrl');
            Posts.list($scope.currentPage, function(data) {
                $scope.list = data;
                $scope.hasMore = $scope.list.length>0;
            });
        })(); 
    }]);

csinc.controller('PostCtrl', ['$rootScope', '$scope', '$routeParams', 'Posts', 'DateService', function ($rootScope, $scope, $routeParams, Posts, DateService) { 
        $scope.post = {};
        $scope.slug = '';
        $scope.monthNames = [ "January", "February", "March", "April", "May", "June", 
            "July", "August", "September", "October", "November", "December" ];

        $scope.formatDate = function(dt) {
            return DateService.formatDate(dt);
        };

        (function init() { 
            // console.log('init PostCtrl');
            $scope.slug = typeof($routeParams.slug) == "undefined" ? 'slug' : $routeParams.slug;
            Posts.get($scope.slug, function(data) {
                $scope.post = data;
                $rootScope.title = $scope.post.title;
            });
        })(); 
    }]);