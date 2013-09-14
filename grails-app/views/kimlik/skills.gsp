<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="kimlik"/>
    <script src="https://ajax.googleapis.com/ajax/libs/angularjs/1.2.0-rc.2/angular.min.js"></script>
    <script src="http://code.angularjs.org/1.2.0-rc.2/angular-animate.min.js"></script>
    <script src="http://code.angularjs.org/1.0.8/angular-resource.min.js"></script>
    <script src="http://angular-ui.github.io/bootstrap/ui-bootstrap-tpls-0.6.0.js"></script>
</head>

<body>
<g:render template="/kimlik/skillsEditable" model="[profile: profile]"></g:render>

<r:script>
    angular.module('kimlik', ['ui.bootstrap', 'ngResource']);
    function TypeaheadCtrl($scope, $http, filterFilter, $resource) {
        $scope.selected = undefined;
        var friends = {}


        $scope.getFriends = function (input) { //todo : bunun yerine friends den search yapalim
            var promise = $http.get("/kimlik/sumnulu/ajaxFriends", {cache: true}).then(function (response) {
                return filterFilter(response.data, input)
            });
            promise.$$v = promise;
            return promise;
        }

        /**
         *
         * @param skillName
         * @param value 1,2,3,4 {Adını duydum | Öğrenmekteyim | Orta seviye | Uzman}
         */
        $scope.rateSelf = function (skillName, value) {
            var skills = $scope.skills
            console.warn(skillName, value);
            for (var idx in skills) {
                if (skills[idx].name == skillName) {
                    skills[idx].self_score = value;
                }
            }
            var api = $resource('/kimlik/sumnulu/ajaxRateSelf');
            api.get({skillName: skillName, value: value})

        }

        /**
         *
         * @param friendId
         * @param skillName
         * @param selected , model
         * @param value {delete | worst | same | better}
         */
        $scope.rateFriend = function (skill, friend, value, model) {


            console.debug(skill, friend, value);

            var friendId = friend.id;
            var skillName = skillName;
            var bucket = skill.profiles[value];

            for (var idx in skill.profiles) {
                var _bucket = skill.profiles[idx];
                var profileIDX = jQuery.inArray(friendId, _bucket)
                if (profileIDX !== -1) {
                    _bucket.splice(profileIDX, 1)
                }
            }

            if (jQuery.inArray(friendId, bucket) === -1) {
                bucket.push(friendId)
                var api = $resource('/kimlik/sumnulu/ajaxRateFriend')
                api.get({skillName: skillName, value: value, friendId: friendId});
            }


            console.log('model', model)
            model.name = ''

        }
        $scope.rateFriendRemove = function (skill, friendId) {
            console.debug(skill.name, friendId);


            var skillName = skillName;

            for (var idx in skill.profiles) {
                var _bucket = skill.profiles[idx];
                var profileIDX = jQuery.inArray(friendId, _bucket)
                if (profileIDX !== -1) {
                    _bucket.splice(profileIDX, 1)
                }
            }
            var api = $resource('/kimlik/sumnulu/ajaxRateFriend')
            api.get({skillName: skillName, value: 'delete', friendId: friendId});

        }

        $scope.skills = [];

        function fetchSkills() {
            var apiSkills = $resource('/kimlik/sumnulu/ajaxSkills')
            $scope.skills = apiSkills.query({}, {}, function (r) {
            })
        }

        function fetchFriends() {
            var apiFriends = $resource('/kimlik/sumnulu/ajaxFriends')
            apiFriends.query({}, {}, function (r) {
                for (var idx in r) {
//                    angular.extend(friends[r[idx].id] , r[idx] );
//                    console.log(friends[r[idx].id])
                    friends[r[idx].id] = r[idx];

                }
            })
        }

        fetchSkills();
        fetchFriends();

        $scope.profile = function (id) {
            if (friends[id] == undefined) {
                friends[id] = {name: 'loading...'}
            }
//            console.log(id)
            return friends[id]
        }

    }
</r:script>

<style type="text/css">
.rateLink {
    margin-right: 3px;
    margin-left: 3px;
}

.selected {
    color: #773317;
    font-size: 15px;
    font-weight: bold;
}

.rateLink:hover, .rateLink:focus, .selected {
    color: #b85026;
    font-size: 15px;
    font-weight: bold;
    outline: 0 !important;
}

.profiles img {
    margin-left: 1px;
    margin-right: 1px;
    margin-bottom: 4px;
}

.thumbnails>li {
    float: left;
    margin-bottom: 5px;
    margin-left: 5px;
}

ul.thumbnails a.remove {
    position: absolute;
    top: -10px;
    right: -5px;

    font-weight: bolder;
    font-size: 20px;
     cursor: alias;
}

.profiles .img {
    position: relative
}


</style>

<div class="separator "></div>

<h2>Yetenek puanlari</h2>


<h5>Bulundugunuz seviye</h5>

<p>Asağıda listelenen konularda bulunduğunuz seviyeyi işaretleyebilirsiniz. Tanıdığınız kişileri kendi bulunduğunuz seviyeye göre gruplayabilirsiniz.
</p>

<h5>Değerlendirme size özeldir</h5>

<p>Yaptiginiz degerlendirmeleri sadece siz gorursunuz. Sizin hakkinizda yapilan degerlendirmelerin kim tarafindan yapildigini goremezsiniz.

<h5>Puan hesaplama da kullanilir</h5>
Baskalarinin sizin hakkiniz da yaptigi degerlendirme sizin o konu
da ne kadar tecrube sahibi oldugunuzu hesaplamaya yardimci olur. <br><strong>Ornek:</strong>  <br>
Eger bir tanisiniz sizi <strong>TASARIM</strong> konusunda kendisinden daha bilgili olarak isaretler ise, ve sizde o kisi icin
kendinizin daha fazla deneyilim oldugunu soylerseniz, <strong>TASARIM</strong> konusunda <strong>puaniniz</strong> artacaktir.
<a href="">daha fazla bilgi icin tiklayin</a>
</p>

<div class="row-fluid" ng-controller="TypeaheadCtrl">
    <div class="span12">
        <g:render template="/kimlik/skill/individual" model="[skill: it]"></g:render>
    </div>
</div>


<script type="text/javascript">

</script>

</body>
</html>
