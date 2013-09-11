<div class="separator line" id="resume"></div>


<div class="heading-buttons">
    <h3 class="glyphicons share_alt"><i></i>  İŞ GEÇMİŞİ<span><g:link action="employment"
                                                                      params="[username: params.username]">hepsini goster</g:link>
    </span></h3>

    <div class="buttons pull-right">
        <g:link action="employment" params="[username: params.username]">düzenle</g:link>
    </div>
</div>
<ul class="history">
    <li class="row-fluid">
        <span class="date span3">
            <button class="btn  btn-primary btn-small">Yeni ekle</button>
            <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
        </span>

        <div class="body span9">
            <h4><input type="text" placeholder="Gorev / Pozisyon"/> @ <input type="text" placeholder="Sirket"/></h4>

            <textarea placeholder="Aciklama"></textarea>    <br>
            <label>Baslangic</label><input type="date" class="input-full"/>    <br>
            <label>Bitis</label><input type="date" class="input-full"/>    <br>
        </div>

        <div class="clearfix"></div>
    </li>
    <g:each in="${profile.workHistory.history}">
        <li class="row-fluid">
            <span class="date span3">
                <span class="label label-inverse">${it.startDate?.year} - ${it.endDate?.year}</span>
                <span class="glyphicons hidden-tablet calendar pull-right"><i></i></span>
            </span>

            <div class="body span9">
                <h4>${it.position} @${it.entity}</h4>
                ${it.note}
            </div>

            <div class="clearfix"></div>
        </li>
    </g:each>
</ul>