<div class="separator line" id="resume"></div>

<div class="row bg-white" id="2column">
    <div class="col-md-8">
        <!--Timeline -->

        <div id="timeline">
            <p>&nbsp;</p>

            <div class="container">
                <p>&nbsp;</p>
                <section class="main">
                    <div class="padder m-t m-b">
                        <div class="timeline">
                            <g:each in="${profile.workHistory.history}">
                                <article class="timeline-item">
                                    <div class="timeline-caption">
                                        <div class="panel arrow arrow-left">
                                            <span class="timeline-icon"><i
                                                    class="icon-mobile-phone time-icon bg-primary"></i></span>
                                            <span class="timeline-date">${(it.startDate) ? 1900 + it.startDate.year : ''} - ${(it.endDate) ? 1900 + it.endDate.year : ''}</span>
                                            <h5>
                                                <span>İş</span>
                                                ${it.position} @${it.entity}
                                            </h5>

                                            <p>${it.note}</p>
                                        </div>
                                    </div>
                                </article>
                            </g:each>

                            <g:each in="${profile.educationHistory.history}">
                                <article class="timeline-item alt">
                                    <div class="timeline-caption">
                                        <div class="panel arrow arrow-left">
                                            <span class="timeline-icon"><i class="icon-calendar time-icon"></i></span>
                                            <span class="timeline-date">${it.startDate?.year} - ${it.endDate?.year}</span>
                                            <h5>
                                                <span>Eğitim</span>
                                                ${it.position} @${it.entity}
                                            </h5>

                                            <p>${it.note}</p>
                                        </div>
                                    </div>
                                </article>
                            </g:each>



                            <div class="timeline-footer"><a href="#"><i
                                    class="icon-plus time-icon inline-block bg-default"></i></a></div>
                        </div>
                    </div>
                </section>
            </div>
        </div>

        <!--Timeline -->
    </div>

    <div class="col-md-4 bg-white">
        sssss <br/>
        <g:link action="employment"
                params="[username: params.username]"><span
                ng-if="isSelfProfile()" ng-cloak>hepsini goster</span></g:link>   <br/>
        <g:link action="employment" params="[username: params.username]"><span ng-if="isSelfProfile()"
                                                                               ng-cloak>düzenle</span></g:link>
        <br/>
        <g:link action="education"
                params="[username: params.username]"><span ng-if="isSelfProfile()"
                                                           ng-cloak>hepsini goster</span></g:link>
        <g:link action="education" params="[username: params.username]"><span ng-if="isSelfProfile()"
                                                                              ng-cloak>düzenle</span></g:link>

    %{--<g:render template="profile/stats" model="[company: company]"></g:render>--}%
    </div>
</div>

