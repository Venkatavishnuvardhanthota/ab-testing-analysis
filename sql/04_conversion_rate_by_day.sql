SELECT
    test_group,
    most_ads_day,
    COUNT(*) AS total_users,
    SUM(converted) AS total_conversions,
    ROUND(SUM(converted) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM ab_test_raw
GROUP BY test_group, most_ads_day
ORDER BY
    test_group,
    CASE most_ads_day
        WHEN 'Monday' THEN 1
        WHEN 'Tuesday' THEN 2
        WHEN 'Wednesday' THEN 3
        WHEN 'Thursday' THEN 4
        WHEN 'Friday' THEN 5
        WHEN 'Saturday' THEN 6
        WHEN 'Sunday' THEN 7
    END;