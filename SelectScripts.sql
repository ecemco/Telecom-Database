

-- 1 Active Customer Details

select
    c.name,
    c.phone,
    sp.name as plan
from subscriptions s
inner join customers c on s.customer_id = c.customer_id
inner join service_plans sp on s.plan_id=sp.plan_id
where s.status='active' and c.status='active'
;


-- SalesType based Subscriptions


SELECT customer_id,
       sp.name                                                                  AS plan_name,
       s.start_date,
       s.end_date,
       sp.monthly_fee                                                           as current_monthly_fee,
       LEAD(sp.monthly_fee) OVER (partition by customer_id order by s.plan_id ) as previous_monthly_fee,
       case
           when sp.monthly_fee > LEAD(sp.monthly_fee) OVER (partition by customer_id order by s.plan_id ) then 'upsell'
           when sp.monthly_fee < LEAD(sp.monthly_fee) OVER (partition by customer_id order by s.plan_id )
               then 'downsell'
           else 'flat'
           end                                                                  as SalesType
FROM subscriptions s
         JOIN service_plans sp ON s.plan_id = sp.plan_id
order by customer_id;





-- Send daily anniversary email/sms


select
    c.name,
    c.email,
    c.phone,
    TIMESTAMPDIFF(year,created_date, now()) customer_years_with_us
from customers c
where concat(MONTH(created_date), '-',day(created_date))= concat(MONTH(now()), '-',day(now()))
;



-- 4. the ones which Monthly fee >50 and have no data limit
SELECT * FROM service_plans WHERE monthly_fee > 50 AND data_limit>0;

-- 5. Top 3 usage of Service Plans
SELECT sp.name, COUNT(*) AS subscriber_count
FROM subscriptions s
JOIN service_plans sp ON s.plan_id = sp.plan_id
GROUP BY sp.name
ORDER BY subscriber_count DESC
LIMIT 3;


-- 6. Number of Cancellations of plans
SELECT sp.name,COUNT(*) AS cancel_count
FROM subscriptions s
JOIN service_plans sp ON s.plan_id = sp.plan_id
WHERE  status = 'canceled'
group by sp.name ;


-- 8. Total call time and data usage for each customer


SELECT c.customer_id, c.name,
       IFNULL(SUM(cr.duration),0) AS total_call_duration,
       IFNULL(COUNT(sms_id),0) as total_sms_send,
       IFNULL(SUM(du.data_used),0) AS total_data_used
FROM customers c
LEFT JOIN subscriptions s ON c.customer_id = s.customer_id
LEFT JOIN call_record cr ON s.subscription_id = cr.subscription_id
LEFT JOIN data_usages du ON s.subscription_id = du.subscription_id
LEFT JOIN sms_records sms ON s.subscription_id=sms.subscription_id
GROUP BY c.customer_id, c.name;




-- 10. Total of unpaid invoices by customers
SELECT c.customer_id, c.name, SUM(i.total_amount) AS total_due
FROM invoices i
JOIN subscriptions s ON i.subscription_id = s.subscription_id
JOIN customers c ON s.customer_id = c.customer_id
WHERE i.status = 'pending'
GROUP BY c.customer_id, c.name;


-- 11. Total of paid invoices by month
SELECT DATE_FORMAT(payment_date, '%Y-%m') AS month,
       COUNT(*) AS num_payments,
       SUM(amount) AS total_paid
FROM payments
GROUP BY month
ORDER BY month;


-- 13. Out of Service Network Elements
SELECT distinct  type, location FROM network_elements WHERE status = 'out_of_service';


-- 14. Number of Calls and Total Call Duration by Network Elements
SELECT ne.network_element_id, ne.type, COUNT(*) AS total_calls, SUM(cr.duration) AS total_duration
FROM network_elements ne
JOIN call_record cr ON ne.network_element_id = cr.network_element_id
GROUP BY ne.network_element_id, ne.type;

-- 15. Total Data Usages by Network Elements
SELECT ne.network_element_id, ne.type, SUM(du.data_used) AS total_data, SUM(du.cost) AS total_cost
FROM network_elements ne
JOIN data_usages du ON ne.network_element_id = du.network_element_id
GROUP BY ne.network_element_id, ne.type;

-- 16. Last Active Subscription and Plan Limit
SELECT c.name, s.phone_number, sp.name AS plan_name, sp.voice_limit, sp.sms_limit, sp.data_limit
FROM customers c
JOIN subscriptions s ON c.customer_id = s.customer_id
JOIN service_plans sp ON s.plan_id = sp.plan_id
WHERE s.status = 'active';

-- 21. Monthly Trend of Usage and Overages
WITH usage_summary AS (SELECT s.customer_id,
                              s.subscription_id,
                              DATE_FORMAT(cr.start_time, '%Y-%m') AS month,
                              SUM(cr.duration)                    AS total_calls,
                              SUM(du.data_used)                   AS total_data,
                              COUNT(sms_id)                       AS total_sms
                       FROM subscriptions s
                                LEFT JOIN call_record cr ON s.subscription_id = cr.subscription_id
                                LEFT JOIN data_usages du ON s.subscription_id = du.subscription_id
                                LEFT JOIN telecom_provider.sms_records sr on s.subscription_id = sr.subscription_id
                       GROUP BY s.customer_id, s.subscription_id, month)
   , limits as (select subscription_id,
                       voice_limit,
                       sms_limit,
                       data_limit,
                       overage_call_rate,
                       overage_sms_rate,
                       overage_data_rate
                from subscriptions s
                         join service_plans sp on s.plan_id = sp.plan_id
                where s.status = 'active')

SELECT customer_id,
       usage_summary.subscription_id,
       month,
       total_calls,
       voice_limit,
       CASE
           WHEN total_calls > voice_limit then total_calls - voice_limit
           else 0 end as overage_voice,
       total_data,
       data_limit,
       CASE
           WHEN total_data > data_limit then total_data - data_limit
           else 0 end as overage_data,
       total_sms,
       sms_limit,
       CASE
           WHEN total_sms > sms_limit then total_sms - sms_limit
           else 0 end as overage_sms
FROM usage_summary
         join limits on limits.subscription_id = usage_summary.subscription_id
where month is not NULL
ORDER BY customer_id, month

;
-- 30. Stuffs with average resolution time lower than 24 hours
SELECT st.stuff_id, COUNT(*) AS resolved_tickets,
       AVG(TIMESTAMPDIFF(HOUR, open_date, close_date)) AS avg_resolution_time
FROM support_tickets st
WHERE TIMESTAMPDIFF(HOUR, open_date, close_date) <= 24
GROUP BY st.stuff_id;

-- Loyal Customers


select
    c.name,
    c.phone,
    c.email,
    c.status
from
(select
    *,
    ROW_NUMBER() over (PARTITION BY customer_id order by start_date) rn
from subscriptions s)a
left join customers c on a.customer_id=c.customer_id
where rn>1

