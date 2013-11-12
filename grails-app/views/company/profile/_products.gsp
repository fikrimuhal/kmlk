<div class="bg-lighter" id="products">

    <div class="container gallery">
        <div class="text-center m-large">
            <h2 class="font-thin">Ürün ve Hizmetler</h2>
        </div>

        <div class="row m-large">

            <g:each in="${company.products}">
                <div class="col-lg-4 col-sm-4">
                    <a href="${it.url}" target="_blank">
                        <p class="text-center"><span class="btn btn-circle btn-lg btn-info"><i
                                class="icon-bookmark"></i></span>
                        </p>

                        <div>
                            <h3 class="text-center">${it.title}</h3>
                            <p class="text-center">${it.url} <br>
                                ${it.about}</p>
                        </div>
                    </a>
                </div>
            </g:each>

        </div>
    </div>
</div>
