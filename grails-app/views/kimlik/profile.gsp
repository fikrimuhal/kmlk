<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="first"/>
    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>

<body>
<g:render template="/shared/header"></g:render>

<section id="content" class="content-sidebar bg-white" ng-controller="UserController">

    <!-- .sidebar -->
    <aside class="sidebar bg-lighter sidebar">
        <div class="text-center clearfix bg-white">
            <img src="${profile.profilePictureUrl}">
        </div>

        <div class="bg-light padder padder-v">
            <span class="h4">${profile.name}</span>
            <small class="block m-t-mini">${profile.workHistory?.lastEntity?.position}</small>
            <button class="btn btn-primary btn-sm active" data-toggle="button">
                <span class="text">
                    <i class="icon-eye-open"></i> Follow
                </span>
                <span class="text-active">
                    <i class="icon-eye-open"></i> Following
                </span>
            </button>
        </div>

        <div class="list-group list-normal m-b-none">
            <a href="#" class="list-group-item">Profile</a>
            <a href="#" class="list-group-item">Activity</a>
            <a href="#" class="list-group-item">Group</a>
            <a href="#" class="list-group-item"><span class="badge m-r">3</span> Friends</a>
            <a href="#" class="list-group-item"><span class="badge m-r">4</span> Posts</a>
        </div>
    </aside>
    <!-- /.sidebar -->

    <!-- .sidebar -->
    <section class="main">
        %{--<div class="padder">--}%
        %{--<div class="row">--}%
        %{--<div class="col-xs-4 bg-primary padder-v">--}%
        %{--<div class="h2">816</div>--}%
        %{--Followers--}%
        %{--</div>--}%

        %{--<div class="col-xs-4 bg-info padder-v">--}%
        %{--<div class="h2">2,875</div>--}%
        %{--Following--}%
        %{--</div>--}%

        %{--<div class="col-xs-4 bg-success padder-v">--}%
        %{--<div class="h2">3,147</div>--}%
        %{--Friends--}%
        %{--</div>--}%
        %{--</div>--}%
        %{--</div>--}%

        <div class="panel ">

            <div class="panel-body bg-white" id="all">
                <g:render template="/kimlik/personalInfo" model="[profile: profile]"/>
                <g:render template="/kimlik/followMe" model="[profile: profile]"/>
                <g:render template="/kimlik/employment" model="[profile: profile]"/>
                <g:render template="/kimlik/skills" model="[profile: profile]"/>
                <g:render template="/kimlik/education" model="[profile: profile]"/>
                %{--<g:render template="/kimlik/testimonials"></g:render>--}%
                %{--<g:render template="/kimlik/portfolio"></g:render>--}%
                <g:render template="/kimlik/contact" model="[profile: profile]"/>
                %{--<g:render template="/kimlik/other"></g:render>--}%

            </div>
        </div>

    </section>
    <!-- /.sidebar -->
</section>

<script>
    var config = {
        username: '${profile.username}',
        isSelfProfile: ${g.isSelfProfile([profile:profile])}
    };
</script>

<g:render template="/shared/footer"/>

<a href="#" class="hide slide-nav-block" data-toggle="class:slide-nav slide-nav-left" data-target="body"></a>
<!-- / footer -->
</body>
</html>
