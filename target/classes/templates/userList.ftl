<#import "parts/common.ftl" as c>
<@c.page>
    <div class="badge badge-primary text-wrap" style="width: 10rem; text-align: center; font-size: 18px; margin: 2px">List of Users</div>
    <table class="table table-striped">
        <thead class="thead-dark">
        <tr>
            <th scope="col">Name</th>
            <th scope="col">Role</th>
            <th scope="col"></th>
        </tr>
        </thead>
        <tbody>
        <#list users as user>
            <tr>
                <td>${user.username}</td>
                <td><#list user.roles as role>${role}<sep>, </#list></td>
                <td><a href="/user/${user.id}">Edit</a> </td>
            </tr>
        </#list>
        </tbody>
    </table>
</@c.page>