<#import "parts/common.ftl" as c>

<@c.page>
    <h3 style="color: brown; text-align: center">Basket</h3>
    <#if baskets??>
        <table class="table table-striped ">
            <thead class="table thead-dark">
                <tr>
                    <th scope="col">Manufacture</th>
                    <th scope="col">Processor</th>
                    <th scope="col">Full Price</th>
                    <th scope="col">Count</th>
                    <th>Del</th>
                </tr>
            </thead>
            <tbody>
            <#list baskets as basket>
                <tr>
                    <td>${basket.computers.manufactureModel}</td>
                    <td>${basket.computers.description}</td>
                    <td class="table-success">${basket.computers.price*basket.count}</td>
                    <td>${basket.count}</td>
                    <td>
                        <form method="post" action="/basket/del/${basket.id}">
                            <input type="hidden" value="${_csrf.token}" name="_csrf">
                            <button type="submit" class="btn btn-danger">Del</button>
                        </form>
                    </td>
                </tr>
            </#list>
            </tbody>
        </table>
        <br>
        <h4>Final sum: ${sum} </h4>
    <#else>
    </#if>

</@c.page>