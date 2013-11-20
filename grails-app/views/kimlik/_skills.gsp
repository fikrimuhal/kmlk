<div class="separator line"></div>


<div class="heading-buttons">
    <h2 class="font-thin"><i class="icon-tags"></i>Bilgi ve beceriler </h2>



    <div class="buttons pull-right">
        <g:link action="skills"
                params="[username: params.username]"><span
                ng-if="isSelfProfile()" ng-cloak>hepsini goster</span></g:link>
        <g:link action="skills" params="[username: params.username]"><span ng-if="isSelfProfile()"
                                                                           ng-cloak>düzenle</span></g:link>
    </div>
</div>

<div class="row">
    <div class="col-lg-6">
        <section class="panel">

            <div class="panel-body">

                <g:each in="${profile.skills.sort { it.percent ? -1 * it.percent : 0 }}" var="it" status="status">

                    <div class="media ${status == 0 ? ' m-t-none' : ''}">
                        <div class="pull-right media-small">${it.name}</div>

                        <div class="progress bg-light">
                            <div class="progress-bar " style="width: ${it.percent}%">
                                %{--${skill.contributors.size()}x--}%</div>
                        </div>
                    </div>
                </g:each>

            </div>
        </section>

    </div>

    <div class="col-lg-6">
        <div class="container">

            <div class="m-none">
                <h2 class="font-thin"><i class="icon-tags"></i>Bilgi ve beceriler</h2>

                <div id="MyPillbox" class="pillbox clearfix m-b">
                    <ul>
                        <g:each in="${profile.skills}">
                            <li class="label bg-info">${it.name}</li>
                        </g:each>

                    </ul>
                </div>

            </div>

        </div>

    </div>  %{--span 6--}%
</div> %{--row--}%
