<#import "parts/common.ftl" as c>


<@c.page>
    <h4 class="text-muted" style="text-align: center; color: #f05837">
        Welcome to our support. All your message enable for every one. It looks like forums.
    </h4>
    <div class="form-row" style="margin-left: 39%; margin-top: 4%;">
        <form method="get" action="/main" class="form-inline">
            <input type="text" name="filter" class="form-control" <#if filter??>value="${filter}"<#else>value=""</#if> placeholder="Search by tag">
            <button type="submit" class="btn btn-primary ml-2">Find</button>
        </form>
    </div>

        <a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample1" role="button" aria-expanded="false" aria-controls="collapseExample" style="margin-left: 43%; ">
            Add new message
        </a>

    <div class="collapse" id="collapseExample1">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="text" class="form-control" placeholder="Enter your message" />
                </div>
                <div class="form-group">
                    <input type="text" name="tag" class="form-control" placeholder="Tag">
                </div>
                <div class="form-group">
                    <div class="custom-file">
                        <input type="file" name="file" id="customFile">
                        <label class="custom-file-label" for="customFile">Choose file</label>
                    </div>
                </div>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                    <div class="form-group">
                        <button type="submit" class="btn btn-primary">Add</button>
                    </div>
            </form>
        </div>
    </div>


    <div style="margin-left: 38%; margin-top: 4%">
    <a class="btn btn-outline-info mt-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Show forum with typical questions
    </a>
    </div>
    <div class="collapse" id="collapseExample">
        <div class="card-columns">
            <#list messages as message>
            <div class="card my-3">
                <#if message.filename??>
                    <img src="/img/${message.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                <span>${message.text}  </span>
                <i style="color: #f05837;"> ~${message.tag}~</i>
                </div>
                <div class="card-footer text-muted">
                    Author: ${message.authorName}
                    <#if message.authorName == user>
                    <form method="post" action="/main/del/${message.id}">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-danger" style="margin-left: 80%">Delete</button>
                    </form>
                    </#if>
                </div>
            </div>
            <#else>
            No message
            </#list>
        </div>
    </div>
</@c.page>
