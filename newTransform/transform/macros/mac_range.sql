{% macro range_highlow(col_h, col_l) %}
    ({{ col_h }} - {{ col_l}} )
{% endmacro %}
