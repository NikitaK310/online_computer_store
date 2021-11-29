<#import "parts/common.ftl" as c>

<@c.page>
    <div class="card-columns" style="max-width: 1540px;">
        <#list computers as computer>
            <div class="card my-3">
                <#if computer.filename??>
                    <img src="/img/${computer.filename}" class="card-img-top">
                </#if>
                <div class="m-2">
                    <span>${computer.manufactureModel}</span>
                    <div>Processor: ${computer.description}</div>
                </div>

                <div class="card-footer text-muted">
                    <p>
                        Price (rub): ${computer.price}
                    </p>
                    <form action="/computer/buy/${computer.id}" method="post"><input type="number" name="count"/>
                        <button type="submit" class="btn btn-primary">Buy</button>
                        <input type="hidden" value="${_csrf.token}" name="_csrf">
                    </form>
                    <div>In stock: ${computer.count}</div>
                </div>

            </div>
        <#else>
            No computers
        </#list>
    </div>
</@c.page>