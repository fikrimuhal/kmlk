<div class="separator line" id="resume"></div>


<div class="heading-buttons">
    <h3 class="glyphicons share_alt"><i></i>  İŞ GEÇMİŞİ<span><g:link action="employment"
                                                                      params="[username: params.username]"> <span  ng-if="isLoggedIn()" ng-cloak>hepsini goster</span></g:link>
    </span></h3>

    <div class="buttons pull-right">
        <g:link action="employment" params="[username: params.username]"><span  ng-if="isLoggedIn()" ng-cloak>düzenle</span></g:link>
    </div>
</div>
<ul class="history">
    <g:each in="${profile.workHistory.history}">
        <li class="row-fluid">
            <span class="date span3">
                <span class="label label-inverse">${(it.startDate)?1900+it.startDate.year:''} - ${(it.endDate)?1900+it.endDate.year:''}</span>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body span9">
                <h4>${it.position} @${it.entity}</h4>
                ${it.note}
            </div>

            <div class="clearfix"></div>
        </li>
    </g:each>
</ul>