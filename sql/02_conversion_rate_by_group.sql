SELECT
    test_group,
    COUNT(*)               AS total_users,
    SUM(converted)          AS total_conversions,
    ROUND(SUM(converted) / COUNT(*) * 100, 2) AS conversion_rate_pct
FROM ab_test_raw
GROUP BY test_group;