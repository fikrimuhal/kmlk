
<div class="row ">

    <div class="col-lg-6">
        <h1 class="font-thin">${profile.name}</h1>
        <br/>
            <div class="row">
                <div class="col-lg-3"><strong>Ad</strong></div>

                <div class="col-lg-9">${profile.name}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Email</strong></div>

                <div class="col-lg-9"><a href="#">${profile.contactInfo?.publicEmail}</a></div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Doğum Tarihi</strong></div>

                <div class="col-lg-9">${profile.birthDate}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Adres</strong></div>

                <div class="col-lg-9"><a href="#">${profile.contactInfo?.address?.display_address?:' Görebilmek için login olun'}</a></div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Tel</strong></div>

                <div class="col-lg-9">${profile.contactInfo?.publicTel}</div>
            </div>

            <div class="row">
                <div class="col-lg-3"><strong>Web</strong></div>

                <div class="col-lg-9"><a href="${profile?.contactInfo?.webSite}">${profile?.contactInfo?.webSite}</a></div>
            </div>
        <br/>
    </div>
    <div class="col-lg-6">
        <div class="bg-white-desktop m-l-n m-r-n m-b-n m-t-n" style="margin-bottom: -90px;">

            <div id="gmap_geocoding" style="height:308px;"> </div>
        </div>
    </div>
</div>
<br/>