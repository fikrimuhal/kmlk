
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

                        <div class="row m-large">

                                <div class="col-lg-2 col-md-3" ng-repeat="p in profiles">
                                    &nbsp;
                                    <a href="{{p.profileUrl}}" class="thumbnail" target="_self">
                                        <img src="{{p.profilePictureUrl}}" title="{{p.first_name}}"/>
                                    </a>
                                </div>
                            %{--<g:if test="${s%4==3}"><div class="clearfix m-b-large visible-md"></div></g:if>--}%
                            %{--<g:if test="${s%6==5}"><div class="clearfix m-b-large visible-lg"></div></g:if>--}%


                        </div>

                    </div>

                </div>
            </div>
        %{--</section>--}%

    </div>
</div>
<!-- / hr -->
