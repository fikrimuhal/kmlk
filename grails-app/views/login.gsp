<!DOCTYPE html>
<html>
<head>
    <meta name="layout" content="front"/>
</head>

<body>
<div id="login">

    <div class="container">

        <div class="wrapper">

            <h1 class="glyphicons unlock">Giriş yap <i></i></h1>

            <!-- Box -->
            <div class="widget widget-heading-simple widget-body-gray">

                <div class="widget-body">

                    <!-- Form -->
                    <form method="post" action="/company">
                        <label>Email adresi</label>
                        <input type="text" class="input-block-level" placeholder="Email adresiniz"/>
                        <label>Parola <a class="password" href="">unuttunuz mu?</a></label>
                        <input type="password" class="input-block-level margin-none" placeholder="Your Password"/>

                        <div class="separator bottom"></div>

                        <div class="row-fluid">
                            <div class="span8">
                                <div class=""><label class="checkbox"><input type="checkbox"
                                                                                      value="remember-me">Beni hatırla
                                </label></div>
                            </div>

                            <div class="span4 center">
                                <button class="btn btn-block btn-inverse" type="submit">Giriş yap</button>
                            </div>
                        </div>
                    </form>
                    <!-- // Form END -->

                </div>

                <div class="widget-footer">
                    <p class="glyphicons restart"><i></i>Lutfen email adresinizi ve parolanizi giriniz...</p>
                </div>
                    <p><strong>todo</strong> Facebook linkedin ile login olma ekle</p>
            </div>
            <!-- // Box END -->

        </div>

    </div>

</div>
<!-- // Wrapper END -->

</body>
</html>
