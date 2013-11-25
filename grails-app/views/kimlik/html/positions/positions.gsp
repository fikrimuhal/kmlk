<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        %{--<section class="panel">--}%
        <header class="panel-heading text-right">
            <ul class="nav nav-tabs pull-left">

                <li ng-class="{active: $routeSegment.contains('inbox')}"><a href="/kimlik/{{user_name}}/positions/inbox"> <i class="fa fa-home icon-large text-default"></i>Teklifler</a></li>
                <li ng-class="{active: $routeSegment.contains('settings')}"><a href="/kimlik/{{user_name}}/positions/settings"> <i class="fa fa-home icon-large text-default"></i>Tercihlerim</a></li>

            </ul>
            <span class="hidden-sm hidden-xs hidden-phone">Şirketler</span>
        </header>


        <div class="panel-body">
            <div class="tab-content">
                <div class="">
                    <div app-view-segment="2"></div>

                </div>

            </div>
        </div>
        %{--</section>--}%

    </div>
</div>
<!-- / hr -->

