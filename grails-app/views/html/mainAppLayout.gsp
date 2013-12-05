<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="first"/>
    <r:require modules="company,first_deprecated,sparkline,easypiechart,googleMaps, landing,fileUpload"/>

    <script type="text/ng-template" id="_template/company.inline">

        <g:render template="/shared/nav"/>

                <section id="content">
                    <section class="main padder" app-view-segment="1"></section>
                </section>

    </script>

    <script type="text/ng-template" id="_template/kimlik.inline">


<section id="content" class="content-sidebar bg-white">

    <!-- .sidebar -->
    <aside class="sidebar bg-lighter sidebar">
        <div class="text-center clearfix bg-white">
            <a href="/kimlik/profile/sumnulu" target="_self">
            <img ng-src="{{getProfilePictureUrl(loggedinUser)}}">
            </a>
        </div>

        <div class="bg-light padder padder-v">
            <a href="/kimlik/profile/{{user_name}}" target="_self"> <span class="h4">{{loggedinUser.first_name}} {{loggedinUser.last_name}}</span></a>
            <!--<small class="block m-t-mini">todo</small>-->
            <!--<button class="btn btn-primary btn-sm active" data-toggle="button">-->
                <!--<span class="text">-->
                    <!--<i class="fa fa-eye-open"></i> TODO-->
                <!--</span>-->
                <!--<span class="text-active">-->
                    <!--<i class="fa fa-eye-open"></i> ODOT-->
                <!--</span>-->
            <!--</button>-->
        </div>
    <g:render template="/kimlik/leftNav"/>

    </aside>
    <!-- /.sidebar -->

                    <section class="main" app-view-segment="1"></section>
 </section>

    </script>

    <script type="text/javascript">
        _settings.staticMode = false; // i.e. locationProvider should USE html5Mode
    </script>


   %{-- <script type="text/javascript"
            src="http://jira.ofis.fikrimuhal.com/s/en_US-h69050-1988229788/6099/11/1.4.0-m3/_/download/batch/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector/com.atlassian.jira.collector.plugin.jira-issue-collector-plugin:issuecollector.js?collectorId=2717829b"></script>
    <script type="text/javascript">window.ATL_JQ_PAGE_PROPS = {
        "triggerFunction": function (showCollectorDialog) {
            //Requries that jQuery is available!
            jQuery("#showFeedBackDialog").click(function (e) {
                e.preventDefault();
                showCollectorDialog();
            });
        }};</script>--}%

</head>

<body>
<g:render template="/shared/header"/>


<div app-view-segment="0"></div>


<g:render template="/shared/modals"/>
<g:render template="/shared/footer"/>

<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
</body>
</html>
