'use strict';
  angular.module('SBSApp', ['angularUtils.directives.dirPagination','ngSanitize', 'ngCsv'])
      .constant("myConfig", {
        //DM::All configurations will be stored here
        "baseURL": "http://172.25.102.115",
        "port": "8086",

        "pSBSnoofsbs": "/api/noofpsbs",
        "pSBSnoofconn": "/api/noofconn_PSBS",
        "pSBSnoofmeta": "/api/psbsMetadata",

        "sSBSnoofsbs": "/api/noofsbs",
        "sSBSnoofconn": "/api/noofconn_SBS",
        "sSBSnoofmeta": "/api/sbsMetadata",


        "sTradeConfInfo": "/api/TradeConfInfo",
        "sTradeConfCount": "/api/TradeConfCount"

    })
    .controller('dashboardCtrl', dashboardCtrl)
	  .controller('calcCtrl', calcCtrl)
	  .controller('authCtrl', authCtrl)
	  .filter('trustedAudioURL', trustedAudioURL);



function trustedAudioURL ($sce) {
		return function (audioURL) {
			return $sce.trustAsResourceUrl(audioURL);
		}

	}

function getNoOfPSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofsbs);
    $scope.pSBSnoofsbs = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofsbs)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.pSBSnoofsbs = response;
            $scope.pSBSnoofsbs.count = (response.data.length) ? (response.data.length) : 0;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - No of PrimarySBS");
        });
}

function getNoOfConnPSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofconn);
$scope.pSBSnoofconn = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofconn)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.pSBSnoofconn = response;
            $scope.pSBSnoofconn.count = response.data[0].ConSum;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - No of connections to PrimarySBS");
        });
}

function getMetadataPSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofmeta);
$scope.pSBSnoofmeta = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.pSBSnoofmeta)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.pSBSnoofmeta = response;
            $scope.pSBSnoofmeta.count = response.data[0].ConSum;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - Metadata of PrimarySBS");
        });
}

function getNoOfSSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofsbs);
$scope.sSBSnoofsbs = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofsbs)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.sSBSnoofsbs = response;
            $scope.sSBSnoofsbs.count = response.data.length;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - No of SecondarySBS");
        });
}

function getNoOfConnSSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofconn);
$scope.sSBSnoofconn = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofconn)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.sSBSnoofconn = response;
            $scope.sSBSnoofconn.count = response.data[0].ConSum;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - No of connections to SecondarySBS");
        });
}

function getMetadataSSBS($scope, $http, myConfig) {

    //console.log("URL: " + myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofmeta);
$scope.sSBSnoofmeta = {
        count : 0
    };

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sSBSnoofmeta)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.sSBSnoofmeta = response;
            $scope.sSBSnoofmeta.count = response.data[0].ConSum;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - Metadata of SecondarySBS");
        });
}

function getTradeConfServiceInfo($scope, $interval, $http, myConfig) {

    $http({
        method: 'GET',
        url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sTradeConfInfo)
    }).
        then(function successCallback(response) {
            //console.log(response);
            $scope.sTradeConfInfo = response;
            console.log(response);
            console.log($scope.sTradeConfInfo);
            //$scope.sTradeConfInfo.count = response.length;
        },
        function errorCallback(err) {
            console.log(err);
            //alert("Error in fetching data. - Metadata of SecondarySBS");
        });

}

function getTradeConfCounts($scope,$interval, $http, myConfig) {

    // $http({
    //     method: 'GET',
    //     url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sTradeConfCount)
    // }).
    //     then(function successCallback(response) {
    //         console.log(response);
    //         $scope.sTradeConfCounts = response.data[0];
    //     },
    //     function errorCallback(err) {
    //         console.log(err);
    //         //alert("Error in fetching data. - Metadata of SecondarySBS");
    //     });

    $interval(function () {
        $http({
            method: 'GET',
            url: (myConfig.baseURL + ':' + myConfig.port + myConfig.sTradeConfCount)
     }).
        then(
			function successCallback(response) {
                console.log(response);
                if($scope.sTradeConfCounts.dLastUpdateTime != response.data[0].dLastUpdateTime)
                {
                    $scope.start = 1;
                }
                else
                    $scope.start = 0;
				                var oldcount = $scope.sTradeConfCounts.nActiveCount;	//take backup of old active calls count
                        $scope.sTradeConfCounts = response.data[0][0];
				                if(oldcount != $scope.sTradeConfCounts.nActiveCount)	//compare old and current active calls
                {
                       getTradeConfServiceInfo($scope,$interval,$http, myConfig);		//get current data
                }

            },
            function errorCallback(err) {
                //console.log(err);
                //alert("Error in fetching data. - Metadata of SecondarySBS");
            });
    }, 1000);
}


function dashboardCtrl($scope, $rootScope, $interval, $http, myConfig) {

      console.log("Dashboard controller called");
      console.log($rootScope.name);

      $scope.name = $rootScope.name;
      console.log($scope.name);

      $scope.sTradeConfInfo = [];

        $scope.currentPage = 1;
     // getNoOfPSBS($scope, $http, myConfig);
    // getNoOfConnPSBS($scope, $http, myConfig);
    // getMetadataPSBS($scope, $http, myConfig);

    // getNoOfSSBS($scope, $http, myConfig);
    // getNoOfConnSSBS($scope, $http, myConfig);
    // getMetadataSSBS($scope, $http, myConfig);

    getTradeConfServiceInfo($scope, $interval, $http, myConfig);

    getTradeConfCounts($scope, $interval, $http, myConfig);

    $scope.start = 0;
    $scope.sTradeConfCounts = [];
    $scope.sTradeConfCounts.dLastUpdateTime = 0;

    // $interval(function () {
    //     if ($scope.start == 0) return;
    //     getTradeConfServiceInfo($scope, $interval, $http, myConfig)
    // },1000);

    $scope.SortByMe=function(x){
        if( $scope.SortBy == x ){
                if ( $scope.reverse != true ){
                        $scope.reverse = true;
                        $scope.SortIcon = 'fa fa-sort-desc';
                }
                else{
                        $scope.reverse = false;
                        $scope.SortIcon = 'fa fa-sort-asc'
                }
        }
        else{
                $scope.SortBy=x;
                $scope.reverse=false;
                $scope.SortIcon = 'fa fa-sort-asc';
        }
    }


    // $scope.saveJSON = angular.toJson($filter('filter')($scope.sTradeConfInfo.data,$scope.searchFilter));


}

function calcCtrl() {

}

function authCtrl($scope, $rootScope, $http, myConfig) {
    //console.log("In");

    var logonsuccess = function (res) {
        //$scope.msg = res.data.msg;
        if(res.data.success == true)
          {
             window.location.href = "dashboard.html";

           console.log(res.data.clientname);

  }  };
    var logonerror = function (res) {
        $scope.msg = res.msg;
        $scope.msgicon = 'fa-check';
    };
    $scope.onlogin = function () {
        console.log("post");
        var uri = myConfig.baseURL + ':' + myConfig.port + '/api/login';
        $http.post(uri, {
            email: $scope.email,
            pwd: $scope.password
        }).then(logonsuccess, logonerror);

    };

   //

}
