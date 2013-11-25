<%@ page contentType="text/html;charset=UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta name="layout" content="first"/>
    <r:require modules="first_deprecated"/>

    <script type="text/javascript">
        _settings.staticMode = true // i.e. locationProvider should not use html5Mode
    </script>
</head>
<body>
<!-- header -->
<header id="header" class="navbar bg bg-black">
    <a href="" class="btn btn-link pull-right m-t-mini"><i class="icon-question icon-xlarge text-default"></i></a>
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
                    <form action="/" class="panel-body">
                        <div class="block">
                            <label class="control-label">Sayfa adı</label>
                            <input type="text" placeholder="Profil adiniz" class="form-control">
                        </div>
                        <div class="block">
                            <label class="control-label">Email adresiniz</label>
                            <input type="email" placeholder="mayday@ouuugkk.com" class="form-control">
                        </div>

                        <div class="checkbox">
                            <label>
                                <input type="checkbox"> Kullanım sözleşmesini kabulet. Okumak için <a href="#">tiklayin</a>
                            </label>
                        </div>
                        <button type="submit" class="btn btn-info">Profilimi oluştur</button>
                        <div class="line line-dashed"></div>
                        <div class="row">
                            <div class="col-sm-6 text-center">
                                <a href="#" class="btn btn-facebook btn-circle btn-sm"><i class="icon-facebook"></i>facebook</a>
                            </div>
                            <div class="col-sm-6 text-center">
                                <a href="#" class="btn btn-twitter btn-circle btn-sm"><i class="icon-twitter"></i>Twitter</a>
                            </div>
                        </div>
                        <div class="line line-dashed"></div>
                        <p class="text-muted text-center"><small>Daha önceden kayıt olduysanız</small></p>
                        <a href="/register/signIn" target="_self" class="btn btn-white btn-block">Giriş yapın</a>
                    </form>
                </section>
            </div>
        </div>
    </div>
</section>
<g:render template="/shared/footer"/>

</body>
</html>