
{% macro gender_id(x) %}

case when {{x}} = 1 then 'Male'
     when {{x}} = 2 then 'Female'
     else 'Unknown'
End 

{% endmacro %}
