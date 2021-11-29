<#import "parts/common.ftl" as c>

<@c.page>
    <h4 style="color: brown; text-align: center">Article Editor</h4>

    <form action="/articles/${articles.id}" method="post" class="needs-validation" novalidate>

        <div>Edit theme: <input type="text" name="theme" value="${articles.theme}"> </div>
        <div>Edit text:  <textarea class="form-control" type="text" name="text"  value="${articles.text}"></textarea></div>

        <div><input type="hidden" value="${articles.id}" name="userID">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Save</button></div>
    </form>

</@c.page>