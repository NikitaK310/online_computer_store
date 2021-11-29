<#import "parts/common.ftl" as c>

<@c.page>
    Computer Editor

    <form action="/computer/${computer.id}" method="post" class="needs-validation" novalidate>


        <input type="text" class="form-control" name="manufactureModel" value="${computer.manufactureModel}">
        <input type="text" class="form-control" name="description" value="${computer.description}">
        <input type="number" class="form-control" name="price" value="${computer.price}">
        <input type="number" class="form-control" name="count" value="${computer.count}">

        <input type="hidden" value="${computer.id}" name="userID">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button class="btn btn-primary" type="submit">Save</button>
    </form>
</@c.page>