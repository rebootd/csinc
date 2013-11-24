angular.module('csinc.resources.posts', [])
    .factory('Posts', ['$http', function ($http) {

    	var Posts = {};
        Posts.list = function (pageNum, callback) {
        	if(!pageNum) { pageNum = 1; }
            $http({ method: 'GET', url: '/blog/posts.json?page=' + pageNum, cache: true }).
                success(function (data, status, headers, config) {
                    callback(data);
                }).
                error(function (data, status, headers, config) {
                    callback({ IsValid: false, Message: 'Error: ' + status });
                });
        };

        Posts.get = function (slug, callback) {
        	$http({ method: 'GET', url: '/posts/get.json?slug=' + slug, cache: true }).
                success(function (data, status, headers, config) {
                    callback(data);
                }).
                error(function (data, status, headers, config) {
                    callback({ IsValid: false, Message: 'Error: ' + status });
                });
        };

        return Posts;

    }]);