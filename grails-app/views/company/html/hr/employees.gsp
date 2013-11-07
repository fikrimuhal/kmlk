<div class="row">
    <div class="col-sm-4 col-md-4">
        <div class="thumbnail" onclick="document.location.href = '/company/people/ilgaz'" style="cursor: hand;">
<g:img uri="/images/photos/ilgaz2.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

            <div class="caption">
                <h4>Ilgaz Şumnulu</h4>

                <p>Bilkent Fizik mezunu. Sheldon Cooper’ın 3. göbekten kuzeni, mucit, fikirlerin arkasındaki adam.</p>

                <!-- Social Icons -->
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>

                <div class="clearfix"></div>
                <!-- // Social Icons END -->
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-md-4">
        <div class="thumbnail" onclick="document.location.href = '/company/people/ilgaz'" style="cursor: hand;">
        <g:img uri="/images/photos/ilgaz3.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

            <div class="caption">
                <h4>Ilgaz Şumnulu</h4>

                <p>Bilkent Fizik mezunu. Sheldon Cooper’ın 3. göbekten kuzeni, mucit, fikirlerin arkasındaki adam.</p>

                <!-- Social Icons -->
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>

                <div class="clearfix"></div>
                <!-- // Social Icons END -->
            </div>
        </div>
    </div>

    <div class="col-sm-4 col-md-4">
        <div class="thumbnail" onclick="document.location.href = '/company/people/ilgaz'" style="cursor: hand;">
<g:img uri="/images/photos/ilgaz4.jpg" alt="100%x200 Image Holder" style="height: 200px;"/>

            <div class="caption">
                <h4>Ilgaz Şumnulu</h4>

                <p>Bilkent Fizik mezunu. Sheldon Cooper’ın 3. göbekten kuzeni, mucit, fikirlerin arkasındaki adam.</p>

                <!-- Social Icons -->
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>
                <a href="" class="glyphicon  glyphicon-info-sign"><i></i></a>

                <div class="clearfix"></div>
                <!-- // Social Icons END -->
            </div>
        </div>
    </div>

</div>


<div class="page-header">

    <h4>Çalışan ekleme istekleri <small>Henüz onaylanmamış personel</small>
        <small class="pull-right"><a href="/company/new"><i
                class="glyphicon glyphicon-plus-sign"></i>
            Yeni kişi ekle</a></small>
    </h4>
</div>

<div class="row">
    <div class="col-md-12">
        <table class="table table-striped" >
            <thead>
            <tr>
                <th>#</th>
                <th>Profil</th>
                <th>Istek yapan</th>
                <th class="col-md-1"></th>
                <th class="col-md-1"></th>
            </tr>
            </thead>
            <tbody>
            <tr ng-repeat="req in employmentRequests">
                <td>1</td>
                <td>Ilgaz Şumnulu</td>
                <td>{{req.requestedByCompany?'Şirket':'Profil'}}</td>
                <td>
                    <button ng-hide="req.requestedByCompany" type="button" class="btn btn-primary">Onayla</button>
                </td>
                <td>
                    <button type="button" class="btn btn-danger">Sil</button>
                </td>
            </tr>

            </tbody>
        </table>
    </div>
</div>
