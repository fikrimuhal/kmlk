<div class="separator line"></div>

<div class="heading-buttons">
    <h3 class="glyphicons share_alt"><i></i>  Eğitim Geçmişi<span><g:link action="education"
                                                                          params="[username: params.username]"><span  ng-if="isSelfProfile()" ng-cloak>hepsini goster</span></g:link>
    </span></h3>

    <div class="buttons pull-right">
        <g:link action="education" params="[username: params.username]"><span  ng-if="isSelfProfile()" ng-cloak>düzenle</span></g:link>
    </div>
</div>
<ul class="history">
    <g:each in="${profile.educationHistory.history}">
        <li class="row">
            <span class="date col-lg-3">
                <span class="label label-important">${it.startDate?.year} - ${it.endDate?.year}</span>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body col-lg-9">
                <h4>${it.position} @${it.entity}</h4>
                ${it.note}
            </div>

            <div class="clearfix"></div>
        </li>
    </g:each>
</ul>