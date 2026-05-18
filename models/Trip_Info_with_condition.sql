
{{ config(materialized = 'table') }}

with Subscriber as (
Select * from {{ source('demo_src','TRIP_INFO')}}
where USERTYPE = 'Subscriber'
)
,
Customer as (
Select * from {{ source('demo_src','TRIP_INFO')}}
where USERTYPE = 'Customer'
)

select a.*, {{ gender_id('a.GENDER')}} as Gender_iden from Subscriber a
union all 
select  b.*, {{ gender_id('b.GENDER')}} as Gender_iden from Customer b
