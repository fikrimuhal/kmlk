<style type="text/css">
.affix {
    position: fixed;
    top: 10px;
    width: 380px;
}
</style>


<h3>Beceri ve yeterlilikler  %{--<a href="#" ng-click="#" class="btn btn-white">Yeni</a>--}%</h3>

<div class="row" ng-controller="TypeaheadCtrl">
    <div class=" col-md-4">
        <br/>
        <form class="form-inline" role="form" ng-controller="NewSkillCtrl">
            <div class="form-group">
                <label class="sr-only">Yeni yetenek:</label>

                <input type="text" class="form-control" placeholder="yeni beceri / yetenek" ng-model="selected"
                       typeahead-editable="true"
                       typeahead-on-select="addSkill($item)"
                       typeahead="skillName.name for skillName in getSkillNames($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
            </div>

            <button ng-click="addSkill(selected)"
                    type="submit"
                    class="btn btn-primary"> <i class="fa fa-plus"></i> Ekle</button>
        </form>

    </div>
    <div class=" col-md-8">
        <table class="table">
            <thead>
            <tr>
                <th class="col-xs-1">Yetenek</th>
                <th class="col-xs-3">Puan</th>
                <th class="col-xs-3">Confidence</th>
                <th class="col-xs-1">Görünür</th>
                <th class="col-xs-2">Önem</th>
            </tr>
            </thead>
            <tbody>

            <tr ng-repeat-start="skill in skills" id="_skill_{{skill.name}}">
                <td colspan="5" class="well %{--bg-lighter--}%" ng-show="isPanelVisible(skill) ">
                    <g:render template="/kimlik/skill/individual"></g:render>


                </td>
            </tr>
            <tr ng-repeat-end>

                <td class="ng-binding">{{skill.name}}</td>
                <td>
                    <div class="progress">
                        <div class="progress-bar progress-bar-info" style="{{'width:'+skill.self_score*20 +'%;'}}">
                            <span class="sr-only ng-binding">90%</span>
                        </div>
                    </div>
                </td>
                <td style="">
                    <div class="progress progress-mini">
                        <div class="progress-mini progress-bar-danger" style="{{'width:'+skill.self_score*10 +'%;'}}">
                            <span class="sr-only ng-binding">90%</span>
                        </div>
                    </div>

                </td>
                <td>
                    <button class="btn btn-white active" ng-class="{'active':skill.visible}"
                            ng-click="toggleVisibility(skill)">
                        <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>

                    </button>
                </td>
                <td>
                    <a href="#" ng-click="togglePanel(skill)"><i class="fa fa-caret-down"></i> detaylar </a>
                </td>
            </tr>

            </tbody>
        </table>
    </div>


</div>
