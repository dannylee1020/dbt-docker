-- get average pitch counts and pitch speed for starter pitcher in post games
-- which hand has better hitting outcome?

with temp1 as(
  select
    gameid,
    pitcherId,
    first_value(nullif(pitcherId,'') ignore nulls) over(partition by gameid order by createdAt) as first_pitcher,
    pitcherPitchCount,
    pitchTypeDescription,
    pitchSpeed,
    createdAt
  from {{ ref('stg_baseball_post') }}
  order by 1
)
,
temp2 as(
  select
    *,  
    case
      when pitcherId = first_pitcher then 'first_pitcher'
      else 'not_first'
    end as pitcher_ind
  from temp1
)
,
temp3 as(
  select
    pitcherId,
    nullif(pitchTypeDescription, '') as pitch_type,
    avg(pitchSpeed) as avg_pitchspeed,
    count(*) as pitch_count
  from temp2
  where pitcher_ind = 'first_pitcher'
  group by 1,2
--   order by 1
)
  select
    pitch_type,
    avg(avg_pitchspeed) overall_avg_pitchspeed,
    avg(pitch_count) as overall_avg_pitch_count
  from temp3
  group by 1
  having pitch_type is not null
  order by 3 desc

  


