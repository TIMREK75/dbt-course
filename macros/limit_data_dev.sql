{% macro limit_data_dev(filter_column, num_days) -%}

{% if target.name == 'dev' -%}
    where {{filter_column}} >= dateadd('day', - {{num_days}}, current_timestamp)
{% endif -%}

{%- endmacro %}