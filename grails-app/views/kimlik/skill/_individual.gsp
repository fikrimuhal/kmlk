<div ng-repeat="skill in skills">
    <!-- Slider -->

    %{--Ayri ayri skiller--}%

    <div class="heading-buttons">
        <h3 class="glyphicons expand"><i></i> {{skill.name}}</h3>

        <div class="buttons pull-right">
            <a href="/kimlik/ilgaz/skills">sil</a>
        </div>
    </div>

    <div class="row-fluid">
        <div class="span12">
            <label class="span2">Sizin Seviyeniz:</label>
            <a ng-click="rateSelf(skill.name,1)" ng-class="{'selected': skill.self_score==1}" class="rateLink"
               href="">Adını duydum</a> |
            <a ng-click="rateSelf(skill.name,2)" ng-class="{'selected': skill.self_score==2}" class="rateLink "
               href="">Öğrenmekteyim</a> |
            <a ng-click="rateSelf(skill.name,3)" ng-class="{'selected': skill.self_score==3}" class="rateLink"
               href="">Orta seviye</a> |
            <a ng-click="rateSelf(skill.name,4)" ng-class="{'selected': skill.self_score==4}" class="rateLink"
               href="">Uzman</a>
        </div>
    </div>
    <h5>Bu konuda</h5>

    <div class="row-fluid">
        <div class="span3">Sizden daha <strong>deneyimsiz</strong> kisiler: <br>
            %{--<pre>Model: {{skill| json}}</pre>--}%
            <input type="text" class="span11" placeholder="ekle" ng-model="skill.selected"
                   typeahead-editable="false"
                   typeahead-on-select="rateFriend(skill,$item,'worst',$model)"
                   typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">

        </div>

        <div class="span9 profiles">
            <ul class="thumbnails">
                <li ng-repeat="id in  skill.profiles.worst" class="img" title="{{profile(id).name}}">
                    <img ng-src="{{profile(id).pictureUrl}}" alt="{{profile(id).name}}" width="50" height="50">
                    <a ng-click="rateFriendRemove(skill,id)" class="remove">x</a></li>
            </ul>
        </div>

        <div class="clear"></div>

    </div>
    <br><br>

    <div class="row-fluid">
        <div class="span3"><br>Sizin ile <strong>eşit</strong> seviyede olan kisiler: <br>
            %{--<pre>Model: {{skill| json}}</pre>--}%
            <input type="text" class="span11" placeholder="ekle" ng-model="skill.selected"
                   typeahead-editable="false"
                   typeahead-on-select="rateFriend(skill,$item,'same',$model)"
                   typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
        </div>


        <div class="span9 profiles">
            <ul class="thumbnails">
                <li ng-repeat="id in skill.profiles.same" class="img" title="{{profile(id).name}}">
                    <img ng-src="{{profile(id).pictureUrl}}" alt="{{profile(id).name}}" width="50" height="50">
                    <a ng-click="rateFriendRemove(skill,id)" class="remove">x</a></li>
            </ul>
        </div>
    </div>

    <br><br>

    <div class="row-fluid">
        <div class="span3">Sizden daha <strong>deneyimli</strong> kisiler: <br>
            %{--<pre>Model: {{skill| json}}</pre>--}%
            <input type="text" class="span11" placeholder="ekle" ng-model="skill.selected"
                   typeahead-editable="false"
                   typeahead-on-select="rateFriend(skill,$item,'better',$model)"
                   typeahead="profile as profile.name for profile in getFriends($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
        </div>


        <div class="span9 profiles">
            <ul class="thumbnails">
                <li ng-repeat="id in  skill.profiles.better" class="img" title="{{profile(id).name}}">
                    <img ng-src="{{profile(id).pictureUrl}}" alt="{{profile(id).name}}" width="50" height="50">
                    <a ng-click="rateFriendRemove(skill,id)" class="remove">x</a></li>
            </ul>
        </div>
    </div>

    <div class="separator "></div>

    <div class="separator line"></div>
    <!-- // Slider END -->
    <!-- Slider -->

</div>