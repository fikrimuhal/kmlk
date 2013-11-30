<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="glyphicons settings"><i></i> Bilgi ve Beceriler<span><g:link action="skills"
                                                                            params="[username: params.username]">hepsini goster</g:link></span>
    </h3>

    <div class="buttons pull-right">
        <g:link action="skills" params="[username: params.username]">düzenle</g:link>
    </div>
</div>

<div class="row-fluid" ng-controller="NewSkillCtrl">
    <div class="span6">
        <table class="table table-condensed">
            <tbody>

            <g:each in="${profile.skills.sort {it.percent?-1*it.percent:0}}">
                <tr>
                    <td class="right muted">${it.name}</td>
                    <td class="w-70">
                        <div class="progress progress-primary">
                            <div class="bar" data-width="${it.percent}%"></div>
                        </div>
                    </td>
                </tr>
            </g:each>

            </tbody>
        </table>
    </div>

    <div class="span6">

        <table class="table table-condensed" ng-controller="NewSkillCtrl">
            <tbody>
            <tr>
                <td class="right muted">Yeni yetenek:</td>
                <td class="w-70">
                    <form>

                        <input type="text" class="span6" placeholder="ekle" ng-model="selected"
                               typeahead-editable="true"
                               typeahead-on-select="addSkill($item)"
                               typeahead="skillName.name for skillName in getSkillNames($viewValue) | filter:$viewValue %{--| limitTo:8--}%">
                        <button ng-click="addSkill(selected)" style="margin-top: -9px;"
                                type="submit"
                                class="btn btn-primary btn-icon glyphicons circle_plus"><i></i>Ekle</button>
                    </form>
                </td>
            </tr>
            <tr>
                <td class="right muted"></td>
                <td class="w-70" >
                    <a ng-repeat="skill in skills"  ng-click="scrollToSkill(skill.name)" href=""><span class="label label-important" style="margin-right: 1px"> {{skill.name}} </span>
                    </a>
                </td>
            </tr>

            </tbody>
        </table>
    </div>  %{--span 6--}%
</div> %{--row--}%


