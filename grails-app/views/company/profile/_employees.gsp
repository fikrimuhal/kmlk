<div class="bg-white-desktop" id="employees">
    <div class="container">
        <p>&nbsp;</p>

        <div class="text-center m-large">
            <h2 class="font-thin">Biz kimiz?</h2>
        </div>

        <div class="row m-large">
            <g:each in="${employees}" var="e" status="i">
                <div class="col-sm-4 col-md-4 ">
                    <div class="thumbnail">
                        <img src="${e.profilePicture.url}" style="height: 200px;"/>

                        <div class="caption">
                            <h4>${e.first_name} ${e.last_name}
                                <div class="pull-right">
                                    <a href="http://kimlik.io${e.profileUrl}" class="btn btn-circle btn-xs btn-twitter"
                                       title="Profile git"><i class="fa fa-twitter"></i></a>
                                    %{--<a href="/kimlik/profile/sumnulu" class="btn btn-circle btn-xs btn-facebook" title="Profile git"><i class="fa fa-facebook"></i></a>--}%
                                    <a href="http://kimlik.io${e.profileUrl}" class="btn btn-circle btn-xs"
                                       title="Profile git"><i class="fa fa-male"></i></a>
                                </div>
                            </h4>

                            <p>${e.aboutText}</p>
                        </div>
                    </div>
                </div>
            </g:each>
            <g:if test="${employees.size()==1}">

                <div class="col-sm-4 col-md-4">
                    <div class="thumbnail">
                        <g:img uri="/images/default_profile.png" alt="100%x200 Image Holder" style="height: 200px;"/>
                        <div class="caption">
                            <h4>Adın Soyadın
                                <div class="pull-right">

                                    %{--<a href="/kimlik/profile/sumnulu" class="btn btn-circle btn-xs btn-facebook" title="Profile git"><i class="fa fa-facebook"></i></a>--}%
                                    <a href="http://kimlik.io/register/signIn" class="btn btn-circle btn-xs"
                                       title="Profile git"><i class="fa fa-male"></i></a>
                                </div>
                            </h4>

                            <p><a href="http://kimlik.io/register/signIn">Bizim ile çalışmak istermisin?</a></p>
                        <br/>
                        <br class="hidden-lg"/>
                        <br class="visible-sm"/>
                        </div>
                    </div>
                </div>
            </g:if>
        </div>

    </div>
</div>