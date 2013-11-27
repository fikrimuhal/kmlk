<div id="timeline">
    <p>&nbsp;</p>

    <div class="container">
        <p>&nbsp;</p>
        <section class="main">
            <div class="padder m-t m-b">
                <div class="timeline">
                    <g:each in="${timeline}" status="s" var="it">

                        <article class="timeline-item ${(s%2 == 0 )?'alt':''}">
                            <div class="timeline-caption ">
                                <div class="panel arrow  ${(s%2 == 0 )?'arrow-right':'arrow-left'}">
                                    <span class="timeline-icon"><i class="fa time-icon ${it.type.color} ${it.type.icon}"></i>
                                    </span>
                                    <span class="timeline-date">${it.sDate} ${(it.eDate)?'/ '+it.eDate:''}</span>
                                    <h5>
                                        <span>${it.friendly}</span>
                                        ${it.title}
                                    </h5>
                                    <p>${it.content}</p>
                                </div>
                            </div>
                        </article>
                    </g:each>


                    <div class="timeline-footer"><a href="#"><i
                            class="fa fa-plus time-icon inline-block bg-default"></i></a></div>
                </div>
            </div>
        </section>
    </div>
</div>
