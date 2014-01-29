<h3>Profil fotoğrafı</h3>
<!-- The file upload form used as target for the file upload widget -->
<form id="fileupload"
      ng-controller="KimlikSettingsProfilePicCtrl" file-upload="options"
      ng-class="{'fileupload-processing': processing() || loadingFiles}">

    <!-- The fileupload-buttonbar contains buttons to add/delete files and start/cancel the upload -->
    <div class="row fileupload-buttonbar">
        <div class="col-lg-7">
            <!-- The fileinput-button span is used to style the file input field as button -->
            <span class="btn btn-success fileinput-button" ng-class="{disabled: disabled}">
                <i class="fa fa-plus"></i>
                <span>Resim seç...</span>
                <input type="file" name="files" multiple ng-disabled="disabled" accept="image/*" capture="camera">
            </span>
            <button type="button" class="btn btn-primary start" ng-click="submit()">
                <i class="fa fa-upload"></i>
                <span>Server'a yolla ve kaydet</span>
            </button>
            <button type="button" class="btn btn-warning cancel" ng-click="cancel()">
                <i class="fa fa-ban"></i>
                <span>Iptal et</span>
            </button>
            <!-- The global file processing state -->
            <span class="fileupload-process"></span>
        </div>
        <!-- The global progress state -->
        <div class="col-lg-5 fade" ng-class="{in: active()}">
            <!-- The global progress bar -->
            <div class="progress progress-striped active" data-file-upload-progress="progress()"><div
                    class="progress-bar progress-bar-success" ng-style="{width: num + '%'}"></div></div>
            <!-- The extended global progress state -->
            <div class="progress-extended">&nbsp;</div>
        </div>
    </div>





    <!-- The table listing the files available for upload/download -->
    <table class="table table-striped files ng-cloak">
        <!-- Araf-->
        <tr ng-repeat="file in queue" ng-class="{'processing': file.$processing()}">
            <td ng-switch data-on="!!file.thumbnailUrl">
                <div class="preview" ng-switch-when="true">
                    <a ng-href="{{file.url}}" title="{{file.name}}" download="{{file.name}}" data-gallery><img
                            ng-src="{{file.thumbnailUrl}}" alt="" height="50"></a>
                </div>

                <div class="preview" ng-switch-default data-file-upload-preview="file"></div>
            </td>
            <td>
                <p class="name" ng-switch data-on="!!file.url">
                    <span ng-switch-when="true" ng-switch data-on="!!file.thumbnailUrl">
                        <a ng-switch-when="true" ng-href="{{file.url}}" title="{{file.name}}" download="{{file.name}}"
                           data-gallery>{{file.name}}</a>
                        <a ng-switch-default ng-href="{{file.url}}" title="{{file.name}}"
                           download="{{file.name}}">{{file.name}}</a>
                    </span>
                    <span ng-switch-default>{{file.name}}</span>
                </p>
                <strong ng-show="file.error" class="error text-danger">{{file.error}}</strong>
            </td>
            <td>
                <p class="size">{{file.size | formatFileSize}}</p>

                <div class="progress progress-striped active fade" ng-class="{pending: 'in'}[file.$state()]"
                     data-file-upload-progress="file.$progress()"><div class="progress-bar progress-bar-success"
                                                                       ng-style="{width: num + '%'}"></div></div>
            </td>
            <td>
                <button type="button" class="btn btn-primary start" ng-click="file.$submit()"
                        ng-hide="!file.$submit || options.autoUpload"
                        ng-disabled="file.$state() == 'pending' || file.$state() == 'rejected'">
                    <i class="fa fa-upload"></i>
                    <span>Kaydet</span>
                </button>
                <button type="button" class="btn btn-warning cancel" ng-click="file.$cancel()" ng-hide="!file.$cancel">
                    <i class="fa fa-ban"></i>
                    <span>İptal</span>
                </button>
                <button ng-controller="FileDestroyController" type="button" class="btn btn-danger destroy"
                        ng-click="file.$destroy()" ng-hide="!file.$destroy">
                    <i class="fa fa-trash-o"></i>
                    <span>Sil</span>
                </button>
            </td>
        </tr>

        <tr ng-repeat="picture in profilePicture.pictures">
            <td>
                <div class="preview">
                    <a ng-href="{{picture.url}}" title="{{picture.name}}" download="{{picture.name}}" data-gallery><img
                            ng-src="{{picture.url}}" alt="" height="55"></a>
                </div>
            </td>
            <td>
                <p class="name">
                    <span>
                        <a ng-href="{{picture.url}}" title="{{picture.source}}" download="{{picture.path}}"
                           data-gallery>göster</a>
                    </span>
                </p>
            </td>
            <td>
                <p class="size">{{picture.source}}</p>
            </td>
            <td>

                <button type="button" class="btn btn-primary" ng-hide="isThisDefaultPicture(picture)"
                        ng-click="makeDefault(picture)">

                    <span>Profil fotoğrafım olarak kullan</span>
                </button>
                <button type="button" class="btn btn-danger destroy pull-right"   ng-show="canBeDeleted(picture)"
                        ng-click="deletePicture(picture)">
                    <i class="fa fa-trash-o"></i>
                    <span>Sil</span>
                </button>
            </td>
        </tr>
    </table>

</form>



<!-- The blueimp Gallery widget -->
<div id="blueimp-gallery" class="blueimp-gallery blueimp-gallery-controls" data-filter=":even">
    <div class="slides"></div>

    <h3 class="title"></h3>
    <a class="prev">‹</a>
    <a class="next">›</a>
    <a class="close">×</a>
    <a class="play-pause"></a>
    <ol class="indicator"></ol>
</div>