<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="first"/>
    <r:require modules="first_deprecated"/>

</head>
<body>
<!-- header -->
<header id="header" class="navbar bg bg-black">
    <a href="docs.html" class="btn btn-link pull-right m-t-mini"><i class="icon-question icon-xlarge text-default"></i></a>
    <a class="navbar-brand" href="#">kimlik</a>
</header>
<!-- / header -->
<section id="content">
    <div class="main padder">
        <div class="row">
            <div class="col-lg-4 col-lg-offset-4 m-t-large">
                <section class="panel">
                    <header class="panel-heading text-center">
                        Sign up
                    </header>
                    <form action="index.html" class="panel-body">
                        <div class="block">
                            <label class="control-label">Display name</label>
                            <input type="text" placeholder="eg. Your name or company" class="form-control">
                        </div>
                        <div class="block">
                            <label class="control-label">Your email address</label>
                            <input type="email" placeholder="test@example.com" class="form-control">
                        </div>
                        <div class="block">
                            <label class="control-label">Type a password</label>
                            <input type="password" id="inputPassword" placeholder="Password" class="form-control">
                        </div>
                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Agree the <a href="#">terms and policy</a>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-info">Sign up</button>
                        <div class="line line-dashed"></div>
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <a href="#" class="btn btn-facebook btn-circle btn-sm"><i class="icon-facebook"></i>Sign up with Facebook</a>
                            </div>
                            <div class="col-sm-6 text-center">
                                <a href="#" class="btn btn-twitter btn-circle btn-sm"><i class="icon-twitter"></i>Sign up with Twitter</a>
                            </div>
                        </div>
                        <div class="line line-dashed"></div>
                        <p class="text-muted text-center"><small>Already have an account?</small></p>
                        <a href="/register/signIn" target="_self" class="btn btn-white btn-block">Sign in</a>
                    </form>
                </section>
            </div>
        </div>
    </div>
</section>
<g:render template="/shared/footer"/>

</body>
</html>