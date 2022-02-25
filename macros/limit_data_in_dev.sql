{% macro limit_data_in_dev(time_column, days=-3) %}
{% if target.name == 'default' -%}
where {{ time_column }} >= dateadd('day', {{days}}, current_timestamp)
{%- endif %}
{% endmacro %}