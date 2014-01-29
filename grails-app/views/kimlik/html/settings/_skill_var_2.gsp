
<section id="content" class="content-sidebar bg-white" style="margin: -15px; width: auto;">

    <!-- .sidebar -->
    <aside class="sidebar sidebar-large">
        <div class="padder header-bar bg clearfix">

            <a href="#" ng-click="forceRecalculate()" class="btn btn-sm btn-white m-t m-b "><i
                    class="fa fa-plus"></i> Yeni ekle</a>

        </div>

        <div class="list-group list-normal m-t-n-xmini scroll-y scrollbar" style="max-height:800px">
            <a ng-repeat="skill in skills" id="_skill_{{skill.name}}" href="#" class="list-group-item">
                <small class="pull-right text-muted">hata {{skill.self_score*7}}%</small>
                <strong>{{skill.name}}</strong><br>
                <small>
                    <div class="progress ">
                        <div class="progress-bar progress-bar-info" style="{{'width:'+skill.self_score*20 +'%;'}}">
                            <span class="sr-only ng-binding">90%</span>
                        </div>
                    </div>
                </small>
            </a>
        </div>
    </aside>
    <!-- /.sidebar -->
    <!-- .main -->
    <section class="main">
        <div class="bg-primary clearfix padder m-b">
            <h3 class="m-b">Java</h3>
        </div>

        <div class="text-small padder">
            <div class="block clearfix"></div>

            <p>butonlar</p>

            <p>sayilar</p>

            <p>aciklamalar</p>

            <p>arkadaslar</p>


            <p class="text-white">
            %{--UGLY HACK container i doldurmak icin!--}%
                <g:each in="${(1..300)}">
                    &NonBreakingSpace;
                </g:each>
            </p>
        </div>

    </section>
    <!-- /.main -->

</section>
