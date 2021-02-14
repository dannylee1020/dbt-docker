# staging data for post season games data

{%- set columns = ['gameId', 'seasonId',	'seasonType',	'year',	'startTime',	'gameStatus',	'attendance',	'dayNight',	'duration',	'durationMinutes',	'awayTeamId',	'awayTeamName',	'homeTeamId',	
'homeTeamName',	'venueName',	'venueSurface',	'venueCapacity',	'venueCity',	'venueState',	'inningNumber',	'inningHalf',	'atBatEventType',	'createdAt',	'updatedAt',	'outcomeId',	'outcomeDescription',	
'hitterId',	'hitterLastName',	'hitterFirstName',	'hitterWeight',	'hitterHeight',	'hitterBatHand',	'pitcherId',	'pitcherFirstName',	'pitcherLastName',	'pitcherThrowHand',	
'pitchType',	'pitchTypeDescription',	'pitchSpeed',	'pitchZone',	'pitcherPitchCount'] %}


select
    {% for col in columns -%}
    {{ col }} {{',' if not loop.last}}
    {% endfor -%}
from {{ source('bigquery_baseball_data', 'games_post_wide') }}





