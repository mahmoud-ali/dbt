SELECT
    s.code                                   AS sale_code,
    s.sale_date,
    CASE s.buyer_type
        WHEN 'exporter' THEN 'شركة صادر'
        WHEN 'saig' THEN 'صائغ'
    END                                        AS buyer_type,
    COALESCE(oe.name, sa.name)               AS buyer,
    st.name                                  AS source_state,
    r.code                                   AS record_code,
    r.almustafid_name,
    d.alloy_weight_gram,
    CASE d.alloy_shape
        WHEN 1 THEN 'دائري'
        WHEN 2 THEN 'مستطيل'
        WHEN 3 THEN 'أخرى'
    END                                       AS alloy_shape,
    -- Created by / Updated by
    cb.username AS created_by_username,
    ub.username AS updated_by_username,

    -- Attachement
    CONCAT('https://mineralsgate.com/app/managers/gold_travel_traditional/appmovegoldtraditional/',s.id,'/change/') as "link",

FROM gold_travel_traditional_sale s
LEFT JOIN gold_travel_lkpowner oe ON s.buyer_exporter_id = oe.id
LEFT JOIN gold_travel_traditional_lkpsaig sa ON s.buyer_saig_id = sa.id
JOIN company_profile_lkpstate st ON s.source_state_id = st.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditional r ON r.sale_id = s.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditionaldetail d ON d.master_id = r.id
LEFT JOIN accounts_customuser cb ON cb.id = s.created_by_id
LEFT JOIN accounts_customuser ub ON ub.id = s.updated_by_id
ORDER BY r.code, d.id
