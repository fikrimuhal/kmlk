<div class="separator line"></div>


<div class="heading-buttons">
    <h2 class="font-thin"><i class="icon-tags"></i>Bilgi ve Yeterlilikler  <small><br/>Bu uzmanlıklar analatik olarak hesaplanmıştır.
        Daha fazla bilgi için <a href="#">tıklayın</a>.</small></h2>
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
    <div class="col-lg-4 col-sm-4">
        <p class="text-center"><span class="btn btn-circle btn-lg btn-default"><i class="icon-refresh"></i>
        </span></p>

        <div>
            <h3 class="text-center">Uzmanlıklar hakkında</h3>

            <p class="text-center">Bu uzmanlıklar analatik olarak hesaplanmıştır. <br/>
                Daha fazla bilgi için <a href="#">tıklayın</a>.</p>
        </div>
    </div>
</div> %{--row--}%
%{--<div class="separator line"></div>--}%
