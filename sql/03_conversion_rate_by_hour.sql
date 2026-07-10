SELECT
    test_group,
    most_ads_hour,
    COUNT(*) AS users_this_hour,
    SUM(converted) AS conversions_this_hour,
    SUM(SUM(converted)) OVER (
        PARTITION BY test_group
        ORDER BY most_ads_hour
    ) AS running_total_conversions,
    SUM(COUNT(*)) OVER (
        PARTITION BY test_group
        ORDER BY most_ads_hour
    ) AS running_total_users
FROM ab_test_raw
GROUP BY test_group, most_ads_hour
ORDER BY test_group, most_ads_hour;