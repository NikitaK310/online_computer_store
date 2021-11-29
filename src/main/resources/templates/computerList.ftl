<#import "parts/common.ftl" as c>
<@c.page>
    List of Computers
    <table class="table">
        <thead>
        <tr class="table-primary">
            <th>Manufacture</th>
            <th>Description</th>
            <th>Price</th>
            <th>Count</th>
            <th>Editor</th>
            <th>Deleter</th>
        </tr>
        </thead>
        <tbody>
        <#list computers as computer>
            <tr>
                <td>${computer.manufactureModel}</td>
                <td>${computer.description}</td>
                <td>${computer.price}</td>
                <td>${computer.count}</td>
                <td><a href="/computer/${computer.id}">Edit</a> </td>
                <td>
                    <form method="post" action="/computer/del/${computer.id}">
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                        <button type="submit" class="btn btn-danger">Del</button>
                    </form>
                </td>
            </tr>
        </#list>
        </tbody>
    </table>

    <div>Computer Add</div>

    <a class="btn btn-primary mt-2" data-toggle="collapse" href="#collapseExample" role="button" aria-expanded="false" aria-controls="collapseExample">
        Add new computer
    </a>

    <div class="collapse" id="collapseExample">
        <div class="form-group mt-3">
            <form method="post" enctype="multipart/form-data">
                <div class="form-group">
                    <input type="text" name="manufactureModel" class="form-control" placeholder="Enter manufacture" />
                </div>
                <div class="form-group">
                    <input type="text" name="description" class="form-control" placeholder="Enter discription">
                </div>
                <div class="form-group">
                    <input type="text" name="price" class="form-control" placeholder="Enter price">
                </div>
                <div class="form-group">
                    <input type="text" name="count" class="form-control" placeholder="Enter count">
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