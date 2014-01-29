<div class="bg-light" id="ofis">
    <p>&nbsp;</p>

    <div class="text-center m-large">
        <h2 class="font-thin">Şirketten görüntüler</h2>
    </div>

    <div class="row m-large">
        <g:each in="${company.officePictures}" status="s" var="picture">
            <div class="col-lg-2 col-md-3">
                &nbsp;
                <a href="${picture.url}" class="thumbnail" data-gallery>
                    <img src="${picture.url}" alt="..."/>
                </a>
            </div>
            %{--<g:if test="${s%4==3}"><div class="clearfix m-b-large visible-md"></div></g:if>--}%
            %{--<g:if test="${s%6==5}"><div class="clearfix m-b-large visible-lg"></div></g:if>--}%
        </g:each>


    </div>

    <div class="clearfix"></div>


    <!-- The blueimp Gallery widget -->
    <div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls">
        <div class="slides"></div>

        <h3 class="title"></h3>
        <a class="prev">‹</a>
        <a class="next">›</a>
        <a class="close">×</a>
        <a class="play-pause"></a>
        <ol class="indicator"></ol>
    </div>
</div>
