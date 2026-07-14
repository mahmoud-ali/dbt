SELECT
    s.id,
    s.code                                   AS sale_code,
    s.sale_date,
    CASE s.buyer_type
        WHEN 'exporter' THEN 'شركة صادر'
        WHEN 'saig' THEN 'صائغ'
    END                                        AS buyer_type,
    COALESCE(oe.name, sa.name)               AS buyer,
    st.name                                  AS source_state,
    s.source_state_id,
    CASE s.state
        WHEN 1 THEN 'قيد البيع'
        WHEN 2 THEN 'اكتمل البيع'
    END                                        AS sale_state,
    -- Created by / Updated by
    cb.username AS created_by_username,
    ub.username AS updated_by_username,
    s.created_at,
    s.updated_at,

    -- Attachement
    CONCAT('https://mineralsgate.com/app/managers/gold_travel_traditional/sale/',s.id,'/change/') as "link",

    SUM(d.alloy_weight_gram)                AS total_weight_g,
    COUNT(d.id)                             AS total_alloy_count,
    COUNT(DISTINCT r.id)                    AS record_count

FROM gold_travel_traditional_sale s
LEFT JOIN gold_travel_lkpowner oe ON s.buyer_exporter_id = oe.id
LEFT JOIN gold_travel_traditional_lkpsaig sa ON s.buyer_saig_id = sa.id
JOIN company_profile_lkpstate st ON s.source_state_id = st.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditional r ON r.sale_id = s.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditionaldetail d ON d.master_id = r.id
LEFT JOIN accounts_customuser cb ON cb.id = s.created_by_id
LEFT JOIN accounts_customuser ub ON ub.id = s.updated_by_id
GROUP BY 1,2,3,4,5,6,7,8,9,10
