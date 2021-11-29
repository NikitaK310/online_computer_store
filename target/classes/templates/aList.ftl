<#import "parts/common.ftl" as c>
<@c.page>
    <h4>List of Articles</h4>
    <#if articles??>
    <table class="table">
        <thead>
        <tr class="table-primary">
            <th>Theme</th>
            <th>Text</th>
            <th>Editor</th>
            <th>Deleter</th>
        </tr>
        </thead>
        <tbody>
        <#list articles as article>
            <tr>
                <td>${article.theme}</td>
                <td>${article.text}</td>
                <td><a href="/articles/${article.id}">Edit</a> </td>
                <td>
                    <form method="post" action="/articles/article/del/${article.id}">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-danger">Del</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>
        <#else>
        No article
    </#if>

    <div>Add Article</div>

    <a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new article
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="theme" class="form-control" placeholder="Enter theme" />
                </div>
                <div class="form-group">
                    <input type="text" name="text" class="form-control" placeholder="Enter text">
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


</@c.page>