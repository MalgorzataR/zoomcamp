{% macro cents_to_dollars(column_name, decimals=2)%}
    {# {%if target.name == "default"%} #}
    round({{column_name}}/100, {{decimals}})
    {# {%endif%} #}
{%endmacro%}