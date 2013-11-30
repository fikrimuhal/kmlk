<style type="text/css">
.affix {
    position: fixed;
    top: 10px;
    width: 380px;
}
</style>


<h3>Yetenekler  <a href="#" ng-click="forceRecalculate()" class="btn btn-white">Yeni</a></h3>

<div class="row" ng-controller="TypeaheadCtrl">

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
                    <a href="#" ng-click="togglePanel(skill)"> detaylar </a>
                </td>
            </tr>
            <tr ng-repeat-end>
                <td colspan="5" class="well %{--bg-lighter--}%" ng-show="isPanelVisible(skill) ">
                    <g:render template="/kimlik/skill/individual"></g:render>


                </td>
            </tr>
            </tbody>
        </table>
    </div>

    <div class=" col-md-4">
        <br/>
        <br/>
%{--
        <section class="panel" id="progressbar" data-spy="affix" data-offset-top="200">
            <header class="panel-heading">
                Java EE
            </header>
            <ul class="list-group">
                <li class="list-group-item">
                    <div class="progress progress-mini m-t-small">
                        <div class="progress-bar progress-bar-info" data-toggle="tooltip" data-original-title="40%"
                             style="width: 40%"></div>
                    </div>

                    <div class="progress progress-mini progress-striped">
                        <div class="progress-bar progress-bar-success" data-toggle="tooltip" data-original-title="10%"
                             style="width: 10%"></div>
                    </div>

                    <div class="progress progress-mini progress-striped">
                        <div class="progress-bar progress-bar-warning" data-toggle="tooltip" data-original-title="50%"
                             style="width: 50%"></div>
                    </div>

                    <div class="progress progress-mini progress-striped active">
                        <div class="progress-bar progress-bar-danger" data-toggle="tooltip" data-original-title="30%"
                             style="width: 30%"></div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="progress progress-small m-t-small">
                        <div class="progress-bar progress-bar-info" data-toggle="tooltip" data-original-title="10%"
                             style="width: 10%"></div>
                    </div>

                    <div class="progress progress-small progress-striped  active">
                        <div class="progress-bar progress-bar-success" data-toggle="tooltip" data-original-title="30%"
                             style="width: 30%"></div>
                    </div>

                    <div class="progress progress-small progress-striped">
                        <div class="progress-bar progress-bar-warning" data-toggle="tooltip" data-original-title="20%"
                             style="width: 20%"></div>
                    </div>

                    <div class="progress progress-small progress-striped">
                        <div class="progress-bar progress-bar-danger" data-toggle="tooltip" data-original-title="10%"
                             style="width: 10%"></div>
                    </div>
                </li>
                <li class="list-group-item">
                    <div class="progress m-t-small">
                        <div class="progress-bar progress-bar-success" data-toggle="tooltip" data-original-title="40%"
                             style="width: 40%"></div>

                        <div class="progress-bar progress-bar-warning" data-toggle="tooltip" data-original-title="10%"
                             style="width: 10%"></div>

                        <div class="progress-bar progress-bar-danger" data-toggle="tooltip" data-original-title="15%"
                             style="width: 15%"></div>
                    </div>
                </li>
            </ul>
        </section>
--}%
    </div>
</div>

<div class="row" >
    ____
    ____
</div>