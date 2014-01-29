/**
 * Created with IntelliJ IDEA.
 * User: sumnulu
 * Date: 7/12/13
 * Time: 8:42 PM
 * To change this template use File | Settings | File Templates.
 */


CTRL.controller('VotablePageCtrl', ['$scope', function ($scope) {
    console.log('VotablePageCtrl basladi');

    $scope.c = {
        title: "İfade özgürlüğünün önündeki engeller kaldırılsın",
        body: "Toplumsal anlaşmazlıkları göz yaşı ve biber gazı bombaları ve su sıkmakla çözmek doğru değildir, bunu yerine tüm partilerin aynı tabanda bir iletişimi gerekmektedir. Uzun vadeli bir toplumsal barış ancak vatandaşların politik planlara geniş kapsamlı ve efektif katılımlarıyla sağlanabilir. Gösteri ve ifade özgürlüğü, özgür ve demokratik bir toplumun yapıtaşlarıdır ve devlet tarafından güvence altına alınmalıdır. Alman KORSANLAR demokratik katılım ve liberal değerler konularında kendilerini uluslararası bir hareketin parçası olarak görmektedir ve bu sebeple de Türkiye’deki protestocularla dayanışma içinde olduklarını ilan etmektedirler.",
        author: {
            fullName: "Beril Kalamış",
            picture: {url: 'http://graph.facebook.com/641180051/picture'},
            id: 12
        }
    };


    //Comments
    $scope.comments = getMockComments();

    $scope.comments.filter = '';
    $scope.comments.setFilter = function (type) {
        $scope.comments.filter = {voteType: type};
    };
    $scope.comments.addComment = function () {     //todo:
        $scope.comments.data.push = {voteType: type};
    };

}]);
