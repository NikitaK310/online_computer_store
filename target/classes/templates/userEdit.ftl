<#import "parts/common.ftl" as c>

<@c.page>
    <h4 style="color: brown; text-align: center">User Editor</h4>

    <form action="/user" method="post" class="needs-validation" novalidate>

        <div class="form-row">
            <div class="col-md-6 mb-3">
                <label for="validationTooltip01">Nikname</label>
                <input type="text" class="form-control" name="username" value="${user.username}" required>
                <div class="valid-tooltip">
                    Looks good!
                </div>
            </div>
            <div class="col-md-6 mb-3">
                <label for="validationTooltip02">Age</label>
                <input type="text" class="form-control" id="validationTooltip02" value="18" required>
                <div class="valid-tooltip">
                    Looks good!
                </div>
            </div>
        </div>
        <#list roles as role>
        <div>
            <label><input type="checkbox"  name="${role}" ${user.roles?seq_contains(role)?string("checked", "")}>${role}</label>
        </div>
        </#list>
        <input type="hidden" value="${user.id}" name="userID">
        <input type="hidden" value="${_csrf.token}" name="_csrf">
        <button type="submit" class="btn btn-primary">Save</button>
    </form>
</@c.page>