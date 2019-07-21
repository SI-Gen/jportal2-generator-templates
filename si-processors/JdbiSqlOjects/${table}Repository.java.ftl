<#import "/helpers/JPortalJavaHelpers.function.ftl" as JavaHelpers>
<#function ToJavaVariableCase field >
        <#-- Takes a field like MyField1 and return myField1 -->
        <#-- Useful for Java vars and getters/setters        -->
        <#return ((field[0..0]?lower_case)+(field[1..]))>
</#function> 

/*
 * This code was generated, do not modify it, modify it at source and regenerate it.
 */

<#if (database.packageName?length > 0)>
package ${database.packageName};

</#if>


import org.jdbi.v3.sqlobject.config.RegisterBeanMapper;
import org.jdbi.v3.sqlobject.statement.GetGeneratedKeys;
import org.jdbi.v3.sqlobject.statement.SqlQuery;
import org.jdbi.v3.sqlobject.statement.SqlUpdate;
import ${database.packageName}.${table}Entity;

public interface ${table}Repository {

<#list table.procs as proc >
<#--  <#assign table = database.tables[0]>  -->
    <#if (proc.name == "SelectOne")>
<#include "SelectOne.ftl.snippet">

    <#elseif (proc.name == "Insert")>
<#include "Insert.ftl.snippet">

    <#elseif (proc.name == "Update")>
<#include "Update.ftl.snippet">

    <#elseif (proc.name == "Delete")>
    DELETE HERE

    <#else>
<#include "CustomProc.ftl.snippet">
    </#if>
</#list>
}

<#--<#function CustomProc>-->
<#--&lt;#&ndash;<#if (proc.isStd() && proc.name == "Insert")>&ndash;&gt;-->
<#--public class ${table}${proc} <#if (proc.isStd())> extends ${table}Standard </#if>-->
<#--{-->


<#--  private static String ${proc.name}_STATEMENT = -->
<#--        <#list proc.lines as myline>-->
<#--          <#if (proc.isStd())>-->
<#--    <#if !(myline.isVar())>"</#if>${myline}<#if !myline.isVar()>"</#if><#if myline_has_next> + </#if>  -->
<#--          </#if>-->
<#--        </#list>-->
<#--  ;-->

<#--    /*-->
<#--     * Getters/Setters-->
<#--     */-->
<#--<#if (proc.isStd())>-->
<#--    <#list table.fields as field>-->
<#--    // Field ${field.name}-->
<#--    public ${table.name} set${field.name?cap_first}(${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} ${ToJavaVariableCase(field.name)}) {-->
<#--        this.${ToJavaVariableCase(field.name)} = ${ToJavaVariableCase(field.name)};-->
<#--    }-->
<#--    public ${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} get${field.name?cap_first}() {-->
<#--        return this.${ToJavaVariableCase(field.name)};-->
<#--    }-->

<#--    </#list>-->
<#--<#else>-->
<#--    // Inputs -->
<#--    <#list proc.getInputs() as field>-->
<#--    public ${table.name} set${field.name?cap_first}(${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} ${ToJavaVariableCase(field.name)}) {-->
<#--        this.${ToJavaVariableCase(field.name)} = ${ToJavaVariableCase(field.name)};-->
<#--    }-->
<#--    public ${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} get${field.name?cap_first}() {-->
<#--        return this.${ToJavaVariableCase(field.name)};-->
<#--    }-->
<#--    </#list>-->
<#--    // Outputs -->
<#--    <#list proc.getInputs() as field>-->
<#--    public ${table.name} set${field.name?cap_first}(${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} ${ToJavaVariableCase(field.name)}) {-->
<#--        this.${ToJavaVariableCase(field.name)} = ${ToJavaVariableCase(field.name)};-->
<#--    }-->
<#--    public ${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} get${field.name?cap_first}() {-->
<#--        return this.${ToJavaVariableCase(field.name)};-->
<#--    }-->
<#--    </#list>        -->
<#--</#if>-->
<#--}-->

<#--</#function>-->
