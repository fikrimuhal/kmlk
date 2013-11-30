<div class="row">
    <div class="col-lg-2 ">
        <label>Seviyeniz:</label>
    </div>

    <div class="col-lg-10 ">
        <div class="btn-group">
            <button type="button" class="btn btn-white btn-xs" ng-click="rateSelf(skill.name,1)"
                    ng-class="{'active': skill.self_score==1}">Adını duydum</button>
            <button type="button" class="btn btn-white btn-xs" ng-click="rateSelf(skill.name,2)"
                    ng-class="{'active': skill.self_score==2}">Giriş seviyesi / Öğrenmekteyim</button>
            <button type="button" class="btn btn-white btn-xs" ng-click="rateSelf(skill.name,3)"
                    ng-class="{'active': skill.self_score==3}">Orta</button>
            <button type="button" class="btn btn-white btn-xs" ng-click="rateSelf(skill.name,4)"
                    ng-class="{'active': skill.self_score==4}">İyi / Çok iyi</button>
            <button type="button" class="btn btn-white btn-xs" ng-click="rateSelf(skill.name,5)"
                    ng-class="{'active': skill.self_score==5}">Uzman</button>
        </div>
    </div>
</div>

<div ng-show="skill.self_score">

    <h4><i>{{skill.name}}</i> , hakkında sizden...</h4>



    <div class="row">
        <div class="col-lg-12">
            <p>deneyimsiz olan kisiler</p>
            <div id="MyPillbox1" class="pillbox clearfix m-b bg-white">
                <ul>
                    <li  ng-repeat="id in skill.profiles.worst" class="label bg-danger text-small font-thin">{{profile(id).name}}</li>
                    <input type="text" class="" placeholder="ekle" ng-model="skill.selected"
                           typeahead-editable="false"
                           typeahead-on-select="rateFriend(skill,$item,'worst',$model)"
                           typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <p>benzer seviyede olan kisiler</p>
            <div id="MyPillbox2" class="pillbox clearfix m-b bg-white">
                <ul>
                    <li  ng-repeat="id in skill.profiles.same" class="label bg-info text-small font-thin">{{profile(id).name}}</li>
                    <input type="text" class="" placeholder="ekle" ng-model="skill.selected"
                           typeahead-editable="false"
                           typeahead-on-select="rateFriend(skill,$item,'same',$model)"
                           typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
                </ul>
            </div>
        </div>
    </div>

    <div class="row">
        <div class="col-lg-12">
            <p>daha deneyimli olan kisiler</p>
            <div id="MyPillbox3" class="pillbox clearfix m-b bg-white">
                <ul>
                    <li  ng-repeat="id in skill.profiles.better" class="label bg-primary text-small font-thin">{{profile(id).name}}</li>
                    <input type="text" class="" placeholder="ekle" ng-model="skill.selected"
                           typeahead-editable="false"
                           typeahead-on-select="rateFriend(skill,$item,'better',$model)"
                           typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
                </ul>
            </div>
        </div>
    </div>


</div>


<div class="buttons pull-right">
    <a ng-click="removeSkill(skill)" href="" class=""><i class="fa fa-times"></i> SİL</a>
</div>