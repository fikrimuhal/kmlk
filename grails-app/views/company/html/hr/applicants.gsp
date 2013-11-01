<style type="text/css">
.progress-bar-none {
    background-color: #f5f5f5;
}
</style>
<div class="row">
    <div class="col-md-12">
        <div class="well well-sm">
            <h4>Filters</h4>

            <div>
                <h5><small>Positions:</small>

                    <a href="#" class="label label-default">Position 1</a>
                    <a href="#" class="label label-default">Position 2</a>
                    <a href="#" class="label label-default">Java developer</a>
                    <a href="#" class="label label-default">Genel başvuru</a>
                </h5>
            </div>

            <div>
                <h5><small>Etiketler:</small>

                    <a href="#" class="label label-primary">Teklif edilecek</a>
                    <a href="#" class="label label-info">Mulakat yapilacak</a>
                    <a href="#" class="label label-warning">Kabul etmedi</a>
                    <a href="#" class="label label-success">Kabul</a>
                    <a href="#" class="label label-danger">Red</a>

                    <small class="pull-right"><a href="/company/new"><i
                            class="glyphicon glyphicon-plus-sign"></i>
                        Yeni etiket ekle</a></small>
                </h5>

            </div>
        </div>
    </div>
</div>

<div class="row">
    <div class="col-md-3">

        <div class="list-group">
            <a ng-repeat="a in applicants"
               href="/company/{{company_name}}/hr/applicants/{{a.id}}"
               class="list-group-item"
               ng-class="{active: $routeSegment.$routeParams.pid ==a.id }">
                {{a.fullName}}
            </a>

        </div>

    </div>

    <div class="col-md-9">
        <div ng-show="position_id" class="panel panel-primary">
            <div class="panel-heading">Ilgaz Şumnulu</div>

            <div class="panel-body">



                <div class="row">
                    <div class="col-md-4">
                        <div class="thumbnail" onclick="document.location.href = '/company/people/ilgaz'"
                             style="cursor: hand;">
                            <img src="{{getApplicant().pictureUrl}}" alt="100%x200 Image Holder" style="height: 150px;">

                        </div>
                    </div>

                    <div class="col-md-8">
                        <h4>Ilgaz Şumnulu</h4>
                        Basic panel example
                        {{$routeSegment.$routeParams | json}}
                        <hr/>
                        <div class="pull-right">
                            <small>Ek göstergeler:</small>
                            <label class="checkbox-inline text-danger">
                                <input type="checkbox" id="inlineCheckbox1" checked="true" value="option1"> Şirket
                            </label>
                            <label class="checkbox-inline text-primary">
                                <input type="checkbox" id="inlineCheckbox2" value="option2"> Siz
                            </label>
                            <label class="checkbox-inline">
                                <select class="form-control input-sm">
                                    <option>Diğer Kişiler</option>
                                    <option>Ilgaz Şumnulu</option>
                                    <option>Diğer Şirket çalışanı</option>
                                    <option>Diğer Şirket çalışanı 2</option>
                                    <option>4</option>
                                    <option>5</option>
                                </select>
                            </label>
                        </div>
                        <br/>
                        <hr/>

                         Startups
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 65%"></div>
                            <div class="progress-bar progress-bar-none" style="width: 10%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.7%"></div>
                        </div>

                        JavaScript
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 35%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.7%"></div>
                            <div class="progress-bar progress-bar-success" style="width: 20%"></div>
                        </div>

                        Java
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 15%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.5%"></div>
                            <div class="progress-bar progress-bar-success" style="width: 20%"></div>
                        </div>


                        AWS
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 5%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.7%"></div>
                            <div class="progress-bar progress-bar-success" style="width: 40%"></div>
                        </div>
                        HTML
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 49%"></div>
                            <div class="progress-bar progress-bar-none" style="width: 5%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.5%"></div>
                        </div>
                        AWS
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 22%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.5%"></div>
                            <div class="progress-bar progress-bar-success" style="width: 5%"></div>
                        </div>
                        AngularJs
                        <div class="progress">
                            <div class="progress-bar progress-bar-success" style="width: 9%"></div>
                            <div class="progress-bar progress-bar-none" style="width: 70%"></div>
                            <div class="progress-bar progress-bar-danger" style="width: 0.5%"></div>
                        </div>


                    </div>
                </div>
            </div>
        </div>

    </div>
</div>
