<!-- hr -->
<div class="row">
    <div class="col-lg-12">

        %{--<section class="panel">--}%
            <header class="panel-heading text-right">
                <ul class="nav nav-tabs pull-left">

                    <li ng-class="{active: $routeSegment.contains('contacts')}"><a href="/kimlik/{{user_name}}/contacts"> <i class="icon-home icon-large text-default"></i>Addres defterim</a></li>

                </ul>
                <span class="hidden-sm hidden-xs hidden-phone">Kişiler</span>
            </header>


            <div class="panel-body">
                <div class="tab-content">
                    <div class="tab-pane fade active in">
                        contacts
                        <div app-view-segment="2"></div>

                    </div>

                </div>
            </div>
        %{--</section>--}%

    </div>
</div>
<!-- / hr -->
