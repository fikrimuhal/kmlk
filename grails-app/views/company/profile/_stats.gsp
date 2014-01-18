<div class="bg-white-desktop" id="featuresxdx">
    <div class="container">

        <div class=" m-t-large m-b-none">

            <h2 class="font-thin"><i class="fa fa-info"></i> Hakkında

                <div class="btn-group pull-right" ng-controller="companyLoggedInUserMenuController" ng-cloak
                     ng-show="isMenuVisible">
                    <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                        <i class="fa fa-cog"></i>
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu ">
                        <li><a href="#" ng-click="iWorkHere()"><i class="fa fa-user fa-fw"></i> Bu şirkette çalışıyorum
                        </a></li>
                        <li><a href="#" ng-click="reportProblem()"><i class="fa fa-flag fa-fw"></i> Sorun bildir</a>
                        </li>

                    </ul>
                </div>
            </h2>
            <a href="#" ng-click="showModal()" ng-controller="companyWorkWithUsController">
                <div class="bg-primary">
                    <div class="container">
                        <div class="text-center m-large">
                            <h2 class="font-thin"><i class="fa fa-group"></i>İş Başvurusu</h2>

                            <p>Bizim ile çalışmak istermisin?</p>
                        </div>

                    </div>
                </div>
            </a>
        </div>
    </div>
</div>


<div class="bg-white-desktop" id="featuresxx">
    <div class="container">
        <div class=" m-t-large m-b-none">
            <h2 class="font-thin"><i class="fa fa-briefcase"></i> Hızlı Istatistikler</h2>

            <table class="table  m-b-none text-small bg-light">

                <tbody>
                <tr>
                    <td>Kuruluş</td>
                    <td class="text- col-lg-1">
                        ${company.founded}
                    </td>
                </tr>

                <tr>
                    <td>Çalışan sayisi</td>
                    <td class="text-">
                        ${company.employeeStats.numberOfTotal}
                    </td>
                </tr>


                <tr>
                    <td>Teknik Personel Orani</td>
                    <td class="text-">
                        ${100 * company.employeeStats.numberOfTechnical / company.employeeStats.numberOfTotal as Integer}%
                    </td>
                </tr>


                <tr>
                    <td>Şirket Türü</td>
                    <td class="text-">
                        ${company.name.legalType}
                    </td>
                </tr>


                <tr>
                    <td>Merkez</td>
                    <td class="text-">
                        İstanbul
                    </td>
                </tr>


                <tr>
                    <td>Sektör</td>
                    <td class="text-">
                        ${company.industry}

                    </td>
                </tr>


                <tr>
                    <td>Toplam Yatırım</td>
                    <td class="text-">
                        ${company.totalInvesment.value + '' + company.totalInvesment.currency}
                    </td>
                </tr>

                </tbody>
            </table>

        </div>

    </div>
</div>


<div class="bg-none" id="featuresxxx">
    <div class="container">

        <div class="m-none">
            <h2 class="font-thin"><i class="fa fa-tags"></i> Faliyet alanları</h2>

            <div id="MyPillbox" class="pillbox clearfix m-b">
                <ul>
                    <g:each in="${company.tags}" var="tag">
                        <li class="label bg-info">${tag}</li>
                    </g:each>
                %{--<input type="text" placeholder="add a pill">--}%
                </ul>
            </div>

        </div>

    </div>
</div>


<div class="bg-none m-b-large">
    <div class="container">

        <div class="m-none">
            <h2 class="font-thin"><i class="fa fa-home"></i>Adres</h2>

            <div class="pillbox">

                <address class="">
                    <strong>${company.name.fullLegal}</strong><br>
                    ${company.location?.display_address}

                    <abbr title="Work email">e-mail:</abbr> <a href="mailto:#">info@fikrimuhal.com</a><br>
                    <abbr title="Work Phone">phone:</abbr> (012) 345-678-901<br>
                    <abbr title="Work Fax">fax:</abbr> (012) 678-132-901
                </address>
            </div>

        </div>

    </div>
</div>

