<#import "/helpers/JPortalJavaHelpers.function.ftl" as JavaHelpers>
<#function ToJavaVariableCase field >
        <#-- Takes a field like MyField1 and return myField1 -->
        <#-- Useful for Java vars and getters/setters        -->
        <#return ((field[0..0]?lower_case)+(field[1..]))>
</#function>
package ${database.packageName};

/*
 * This code was generated, do not modify it, modify it at source and regenerate it.
 */

<#if (database.packageName?length > 0)>

</#if>
<#list table.fields as field>
    <#if field.type==18>
import java.sql.Timestamp;
        <#break>
    </#if>
</#list>

<#list table.fields as field>
    <#if (field.enums?size>0)>
enum e${field.name}Enum {
        <#list field.enums as enum>
${enum.value}=${enum.value}<#if enum_has_next>,</#if>
        </#list>
}
    </#if>
</#list>

<#--  <#assign table = database.tables[0]>  -->
public class ${table}Entity
{
    /*
    * Fields
    */
    <#list table.fields as field>
    private ${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} ${ToJavaVariableCase(field.name)};
    </#list>

    /*
     * Getters/Setters
     */
    <#list table.fields as field>
    // Field ${field.name}
    public ${table.name}Entity set${field.name?cap_first}(${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} ${ToJavaVariableCase(field.name)}){
        this.${ToJavaVariableCase(field.name)} = ${ToJavaVariableCase(field.name)};
        return this;
    }
    public ${JavaHelpers.JPortalJavaFieldTypeLookup(field.type)} get${field.name?cap_first}() {
        return this.${ToJavaVariableCase(field.name)};
    }

    </#list>
}
