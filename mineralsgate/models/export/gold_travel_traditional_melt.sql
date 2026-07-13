SELECT
    mb.code                                     AS batch_code,
    mb.melt_date,
    mb.melt_workshop,
    mb.standardization_lab,
    st.name                                     AS source_state,
    r.code                                      AS record_code,
    r.almustafid_name,
    d.alloy_weight_gram,
    CASE d.alloy_shape
        WHEN 1 THEN 'دائري'
        WHEN 2 THEN 'مستطيل'
        WHEN 3 THEN 'أخرى'
    END                                          AS alloy_shape
FROM gold_travel_traditional_meltbatch mb
JOIN company_profile_lkpstate st ON mb.source_state_id = st.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditional r ON r.melt_batch_id = mb.id
LEFT JOIN gold_travel_traditional_appmovegoldtraditionaldetail d ON d.master_id = r.id
ORDER BY r.code, d.id