<#include "security.ftl">
<#import "login.ftl" as l>

<nav class="navbar navbar-light bg-light" style="justify-content: center">
    <a class="navbar-brand" href="/main">
        Woow Computer Market
    </a>
</nav>

<nav  class="navbar navbar-expand-lg navbar-dark bg-dark">
    <a class="navbar-brand " href="/" style="font-size: 25px" >WCM</a>
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto">
            <li class="nav-item">
                <a class="nav-link" href="/article" style="font-size: 25px"> Articles </a>
            </li>
            <div class="btn-group" role="group" style="margin-right: 5px">
                <button id="btnGroupDrop1" type="button" class="btn btn-secondary dropdown-toggle" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                    Gadgets
                </button>
                <div class="dropdown-menu" aria-labelledby="btnGroupDrop1">
                    <a class="dropdown-item" href="/computers">Computers</a>
                    <a class="dropdown-item" href="#">...</a>
                </div>
            </div>
            <#if isAdmin>
                <div class="btn-group btn-group-sm mr-2" role="group" aria-label="First group" >
                    <button type="button" class="btn btn-info"><a class="nav-link" href="/computer"> Computer List </a></button>
                    <button type="button" class="btn btn-primary"><a class="nav-link" href="/articles"> Article List </a></button>
                    <button type="button" class="btn btn-info"> <a class="nav-link" href="/user"> User list </a></button>
                </div>
            </#if>
            <li class="nav-item">
                <a class="nav-link" href="/main" style="font-size: 25px"> Support </a>
            </li>
        </ul>
        <div style="font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; color: gold; font-size: 25px ">Basket: </div>
            <div class="nav-item">
                <a class="nav-link" href="/basket"><img src="/static/img/orange.png"/> </a>
            </div>
        <div class="navbar-text mr-3">${name}</div>
        <@l.logout />
    </div>
</nav>