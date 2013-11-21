<div class="separator line"></div>


<div class="heading-buttons">
    <h2 class="font-thin"><i class="icon-tags"></i>Bilgi ve Yeterlilikler </h2>



    <div class="buttons pull-right">
        <g:link action="skills"
                params="[username: params.username]"><span
                ng-if="isSelfProfile()" ng-cloak>hepsini goster</span></g:link>
        <g:link action="skills" params="[username: params.username]"><span ng-if="isSelfProfile()"
                                                                           ng-cloak>düzenle</span></g:link>
    </div>
</div>

<div class="row">

    <div class="col-lg-4 col-sm-4">
        <section class="panel">

            <div class="panel-body">

                <g:each in="${skills1}" var="skill" status="status">

                    <div class="media ${status == 0 ? ' m-t-none' : ''}">
                        <div class="pull-right media-small">${skill.name}</div>

                        <div class="progress bg-light">
                            <div class="progress-bar ${skill.cssClass}" style="width: ${skill.percent}%">
                                %{--${skill.contributors.size()}x--}%</div>
                        </div>
                    </div>
                </g:each>

            </div>
        </section>
    </div>

    <g:if test="${skills2}">
        <div class="col-lg-4 col-sm-4">
            <section class="panel">

                <div class="panel-body">

                    <g:each in="${skills2}" var="skill" status="status">

                        <div class="media ${status == 0 ? ' m-t-none' : ''}">
                            <div class="pull-right media-small">${skill.name}</div>

                            <div class="progress bg-light">
                                <div class="progress-bar ${skill.cssClass}" style="width: ${skill.percent}%">
                                   %{-- ${skill.contributors.size()}x--}%</div>
                            </div>
                        </div>
                    </g:each>

                </div>
            </section>

        </div>
    </g:if>
</div> %{--row--}%
