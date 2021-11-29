<#import "parts/common.ftl" as c>

<@c.page>
    <h4 style="color: brown; font-family: 'DejaVu Sans', Arial, Helvetica, sans-serif; text-align: center;">Welcome to our technical portal. Here you can read articles and buy some gadgets!! </h4>
<#if articles??>
    <div class="card">
        <#list articles as article>
        <div class="card-header" style="color: darkblue; font-size: 28px;">
            ${article.theme}
        </div>
        <div class="card-body" style="margin-bottom: 10px">
            <#if article.filename??>
                <img src="/img/${article.filename}" class="card-img-top">
            </#if>
            <blockquote class="blockquote mb-0">
                <p>${article.text}</p>
                <footer class="blockquote-footer">Written by: <cite title="Source Title">${article.author.username}</cite></footer>
            </blockquote>
        </div>
        <#else>
            No articles
        </#list>
    </div>
    </#if>

</@c.page>
