
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

select * from Subscriber
union all 
select * from Customer
