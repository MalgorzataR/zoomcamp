{# {{union_tables_by_prefix(database='dbt-tutorial', schema='dbt_learn_jinja', prefix='orders__')}} #}

{{ grant_select(schema=target.schema, role=target.role)}}