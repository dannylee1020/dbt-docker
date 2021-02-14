-- which hand has better hitting outcome on average?
with temp1 as(
  select 
    gameId,
    nullif(hitterId,'') as hitterId,
    hitterBatHand,
    nullif(outcomeDescription,'') as outcome_description
  from {{ ref('stg_baseball_post') }}
  where lower(outcomeDescription) in ('single','double','triple','homerun','groud out','fly out','strike swining - out at home','strike looking')
)
,
temp2 as(
  select
    gameId,
    hitterBatHand,
    outcome_description,
    count(*) as outcome_count
  from temp1
  group by 1,2,3
)
  select
    hitterBatHand,
    outcome_description,
    avg(outcome_count) as avg_outcome_count
  from temp2
  group by 1,2
  order by 2
