<div class="separator line" id="resume"></div>


<div class="heading-buttons">
    <h3 class="glyphicons share_alt"><i></i>  İŞ GEÇMİŞİ<span><g:link action="employment"
                                                                      params="[username: params.username]">hepsini goster</g:link>
    </span></h3>

    <div class="buttons pull-right">
        <g:link action="employment" params="[username: params.username]">düzenle</g:link>
    </div>
</div>
<ul class="history">
    <li class="row-fluid">
        <form novalidate>
            <span class="date span3">
                <button class="btn  btn-primary btn-small" ng-click="addWork(newWork)">Yeni ekle</button>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body span9">
                <h4><input type="text" placeholder="Gorev / Pozisyon" ng-model="newWork.position"/> @ <input type="text"
                                                                                                             placeholder="Sirket"
                                                                                                             ng-model="newWork.entity"/>
                </h4>

                <textarea placeholder="Aciklama" ng-model="newWork.note"></textarea>    <br>
                <label>Baslangic</label><input type="date" class="input-full" ng-model="newWork.startDate"/>    <br>
                <label>Bitis</label><input type="date" class="input-full" ng-model="newWork.endDate"/>    <br>
            </div>

        </form>

        <div class="clearfix"></div>
    </li>
    <li class="row-fluid" ng-repeat="elm in getEmploymentHistory()|orderBy:elm.id:false" ng-cloak>
        <div ng-if="!elm.showEdit">

            <span class="date span3">
                <span class="label label-inverse">{{elm.startDate | date:'MM/yyyy'}} - {{elm.endDate | date:'MM/yyyy'}}</span>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body span9">
                <h4>{{elm.position}} @ {{elm.entity}}</h4>

                <div class="well">{{elm.note}}
                    <span class="pull-right"><a ng-click="elm.showEdit = true" href="">düzenle</a></span>
                </div>

            </div>
        </div>

        <form novalidate ng-if="elm.showEdit">

            <span class="date span3">
                <span class="label label-inverse">{{elm.startDate.year}} - {{elm.endDate.year}}</span>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body span9">
                <h4><input type="text" placeholder="Gorev / Pozisyon" ng-model="elm.position"/> @ <input
                        type="text"
                        placeholder="Sirket"
                        ng-model="elm.entity"/>
                </h4>
                <span class="pull-right"><a ng-click="save(elm)" href="">kaydet</a></span>
                  <pre>
                      {{elm | json}}
                  </pre>
                <textarea placeholder="Aciklama" ng-model="elm.note"></textarea>    <br>
                <label>Baslangic</label><input type="date" class="input-full" ng-model="elm.startDate"/>    <br>
                <label>Bitis</label><input type="date" class="input-full" ng-model="elm.endDate"/>    <br>
            </div>

        </form>

        <div class="clearfix"></div>
    </li>
</ul>
%{--<pre>--}%
%{--{{newWork | json}}--}%
%{--</pre>--}%

%{--<pre>--}%
%{--{{getEmploymentHistory() | json}}--}%
%{--</pre>--}%