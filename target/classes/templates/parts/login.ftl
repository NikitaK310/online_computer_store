<#macro login path isRegisterForm>
<form action="${path}" method="post" xmlns="http://www.w3.org/1999/html">
    <div class="container login-container">
        <div class="row">
            <div class="col-md-6 login-form-2">
                <div class="login-logo">
                    <img src="https://image.ibb.co/n7oTvU/logo_white.png" alt=""/>
                </div>
                <h3>To authorize type your data</h3>
                <div class="form-group">
                    <input type="text" name="username" class="form-control" placeholder="User name"/>
                </div>
                <div class="form-group">
                    <input type="password" name="password" class="form-control" placeholder="Password"/>
                </div>
                <#if isRegisterForm>
                    <div class = "form-group row">
                        <label class="col-sm-2 col-form-label"> Email: </label>
                        <div class="col-sm-6">
                            <input type="email" name="email" class="form-control" placeholder="some@some.com"/>
                        </div>
                    </div>
                </#if>
                <input type="hidden" name="_csrf" value="${_csrf.token}" />
                <div><div style="font-family: 'Minion Pro'; text-align: center">If you don't have an account, please register</div>
                    <#if !isRegisterForm><a href="/registration" style="color: aliceblue; padding-left: 36%;">Create an account</a></#if></div>
                <div><button class="btn btn-primary n" type="submit"><#if isRegisterForm>Create<#else>Sign In</#if></button></div>
                </form>
            </div>
        </div>
    </div>
</form>
</#macro>

<#macro logout>
<form action="/logout" method="post">
    <input type="hidden" name="_csrf" value="${_csrf.token}" />
    <button class="btn btn-primary" type="submit" >Sign Out</button>
</form>
</#macro>
