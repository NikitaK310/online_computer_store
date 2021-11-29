<#import "parts/common.ftl" as c>
<#import "parts/login.ftl" as l>

<@c.page>
   <#if message??>${message}<#else></#if>
    <@l.login "/registration" true/>
</@c.page>