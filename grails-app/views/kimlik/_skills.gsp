<div class="separator line"></div>


<div class="heading-buttons">
    <h3 class="font-thin"><i class="fa fa-tags"></i> Bilgi ve Yetkinlikler

        <g:if test="${!skills1}">
            <small ng-show="isLoggedIn()">

                <a href="/kimlik/{{getLoggedInUser().username}}/settings/skills">Yetkinliklerinizi ayarlardan düzenleye bilirsiniz.</a>
            </small>
        </g:if>
        <small><br/>Bu uzmanlıklar analatik olarak hesaplanmıştır.
        Daha fazla bilgi için <a href="#">tıklayın</a>.</small></h3>
</div>

<div class="row">
    <g:if test="${skills1}">
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

        <div class="col-lg-4 col-sm-4">
            <p class="text-center"><span class="btn btn-circle btn-lg btn-default"><i class="fa fa-refresh"></i>
            </span></p>

            <div>
                <h3 class="text-center">Uzmanlıklar hakkında</h3>

                <p class="text-center">Bu uzmanlıklar analatik olarak hesaplanmıştır. <br/>
                    Daha fazla bilgi için <a href="#">tıklayın</a>.</p>
            </div>
        </div>
    </g:if>
</div> %{--row--}%
%{--<div class="separator line"></div>--}%
