skills
<div class="row">

<div class=" col-md-3">
    <h3>Yetenekler  <a href="#" ng-click="forceRecalculate()" class="btn btn-white pull-right">Yeni</a></h3>
    <br>
    <p>

    </p>
</div>

<div class=" col-md-9">
<table class="table">
<thead>
<tr>
    <th class="col-xs-1">Yetenek</th>
    <th class="col-xs-3">Puan</th>
    <th class="col-xs-3">Katkıda bulunanlar</th>
    <th class="col-xs-1">Görünür</th>
    <th class="col-xs-2">Önem</th>
</tr>
</thead>
<tbody>

<tr>
    <td class="ng-binding">MongoDB</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:90%;">
                <span class="sr-only ng-binding">90%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Subversion</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Java</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">S3</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:90%;">
                <span class="sr-only ng-binding">90%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">EC2</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:90%;">
                <span class="sr-only ng-binding">90%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Amazon Web Services</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">HTML</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:90%;">
                <span class="sr-only ng-binding">90%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Agile Project Management</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Grails</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Machine Learning</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:25%;">
                <span class="sr-only ng-binding">25%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">LabVIEW</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           
           <i ng-if="!skill.visible" class="fa fa-eye-slash text-active text-danger ng-scope"></i><!-- end ngIf: !skill.visible -->
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">AWS</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Artificial Intelligence</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Lean Startup</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:90%;">
                <span class="sr-only ng-binding">90%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Groovy</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">javascript</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">J2EE</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Matlab</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:70%;">
                <span class="sr-only ng-binding">70%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Git</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:25%;">
                <span class="sr-only ng-binding">25%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Eclipse</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           
           <i ng-if="!skill.visible" class="fa fa-eye-slash text-active text-danger ng-scope"></i><!-- end ngIf: !skill.visible -->
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Software Project Management</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:25%;">
                <span class="sr-only ng-binding">25%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Pattern recognition</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Microfluidics</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           
           <i ng-if="!skill.visible" class="fa fa-eye-slash text-active text-danger ng-scope"></i><!-- end ngIf: !skill.visible -->
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Microfabrication</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:25%;">
                <span class="sr-only ng-binding">25%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           
           <i ng-if="!skill.visible" class="fa fa-eye-slash text-active text-danger ng-scope"></i><!-- end ngIf: !skill.visible -->
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Maven</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:25%;">
                <span class="sr-only ng-binding">25%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Linux server administration</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:50%;">
                <span class="sr-only ng-binding">50%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Debian/Ubuntu</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:5%;">
                <span class="sr-only ng-binding">5%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">vert.x</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:5%;">
                <span class="sr-only ng-binding">5%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' --><tr>
    <td class="ng-binding">Scrum</td>
    <td>
        <div class="progress">
            <div class="progress-bar progress-bar-info" style="width:5%;">
                <span class="sr-only ng-binding">5%</span>
            </div>
        </div>
    </td>
    <td style="">
        <ul>

            <li class="label label-primary pull-left m-b-mini m-r-mini  ">undefined undefined</li>
        </ul>

    </td>
    <td>
        <button class="btn btn-white active" ng-class="{'active':skill.visible}" ng-click="toggleVisibility(skill)">
           <i class="fa fa-lightbulb-o text-active text-warning ng-scope"></i>
       
        </button>
    </td>
    <td>
        <input class="form-control " type="number" min="1" ng-model="skill.order" ng-change="updateOrder(skill)">
    </td>
</tr><!-- end ngRepeat: skill in skills | orderBy:'order' -->

</tbody>
</table>
</div>
</div>