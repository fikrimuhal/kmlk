<div id="menu" class="hidden-phone">

    <h1>${profile.name}</h1>
    <span class="profile">
        <span class="img"><img src="${profile.profilePictureUrl}"
                               alt="${profile.name}"/></span>
        <span>
            <a data-defaultLink class="glyphicons user" href="/kimlik/${profile.username}"><i></i>About me</a>
            <a class="glyphicons notes_2" href="#resume"><i></i>Resume</a>
            <a class="glyphicons iphone_shake" href="#contact"><i></i>Contact</a>
        </span>
    </span>

    <a href="#contact"
       class="btn btn-block btn-primary btn-large glyphicons pencil hire-me">Hire me<span>I'm available</span><i></i>
    </a>
    <ul class="nav" data-spy="affix" data-offset-top="250" class="scrollTo">
        <li class="active"><a href="#content"><span>hakkımda</span></a></li>
        <li><a href="#resume"><span>öz geçmişim</span></a></li>
        <li><a href="#testimonials"><span>hakkımdaki yorumlar</span></a></li>
        %{--<li><a href="#portfolio"><span>portfolio</span></a></li>--}%
        %{--<li><a href="#blog"><span>blog</span></a></li>--}%
        <li><a href="#contact"><span>contact</span></a></li>
        %{--<li><a href="#other"><span>other</span></a></li>--}%
        %{--<li><a href="#themer" class="btn btn-large btn-inverse btn-block btn-themer"--}%
        %{--data-toggle="collapse"><span>Themer</span></a></li>--}%
    </ul>

    <div>
       <p>
           <a data-defaultLink href="/terms"> kullanici sozlesmesi</a>   <br>
           <a data-defaultLink href="/register">Kayit ol ve kimlik.io profilini olustur </a><br>
           <a data-defaultLink href="/">kimlik.io</a>   <br>

       </p>
    </div>
</div>