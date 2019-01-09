1.	

select count (distinct utm_campaign) 
from page_visits;

select count (distinct utm_source)
from page_visits;

select distinct utm_campaign, utm_source
from page_visits;

2. 

select distinct page_name
from page_visits;

3.

WITH first_touch AS (
SELECT user_id,
MIN(timestamp) AS 'first_touch_at'
FROM page_visits
GROUP BY user_id)
SELECT ft.user_id,
ft.first_touch_at,
pv.utm_source,
pv.utm_campaign,
count (utm_campaign)
FROM first_touch AS 'ft'
JOIN page_visits AS 'pv'
ON ft.user_id = pv.user_id
AND ft.first_touch_at = pv.timestamp
group by 4
order by 5 desc;

4. 

WITH last_touch AS (
SELECT user_id,
MAX(timestamp) AS 'last_touch_at'
FROM page_visits
GROUP BY user_id)
SELECT lt.user_id,
lt.last_touch_at,
pv.utm_source,
pv.utm_campaign,
count (utm_campaign)
FROM last_touch AS 'lt'
JOIN page_visits AS 'pv'
ON lt.user_id = pv.user_id
AND lt.last_touch_at = pv.timestamp
group by 4
order by 5 desc;

5. 

select count (distinct user_id)
from page_visits
where page_name = '4 - purchase';

6. 

WITH last_touch AS (
SELECT user_id,
MAX(timestamp) AS 'last_touch_at'
FROM page_visits
where page_name = '4 - purchase'
GROUP BY user_id)
SELECT lt.user_id,
lt.last_touch_at,
pv.utm_source,
pv.utm_campaign,
count (utm_campaign)
FROM last_touch AS 'lt'
JOIN page_visits AS 'pv'
ON lt.user_id = pv.user_id
AND lt.last_touch_at = pv.timestamp
group by 4
order by 5 desc;

