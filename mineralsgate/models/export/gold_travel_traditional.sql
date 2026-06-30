SELECT
    -- Master record
    m.id,
    m.code,
    m.issue_date,
    m.created_at,
    m.updated_at,

    -- State (choice) resolved
    CASE m.state
        WHEN 1 THEN 'جديد'
        WHEN 2 THEN 'مباع'
        WHEN 3 THEN 'منتهي'
        WHEN 4 THEN 'تجديد'
        WHEN 5 THEN 'ملغي'
        WHEN 6 THEN 'وصل للوجهة'
        ELSE 'غير معروف'
    END AS record_state,

    -- Beneficiary (almustafid)
    m.almustafid_name,
    m.almustafid_phone,

    -- Identity type (choice) resolved
    CASE m.almustafid_identity_type
        WHEN 1 THEN 'جواز سفر'
        WHEN 2 THEN 'بطاقة شخصية'
        WHEN 3 THEN 'رقم وطني'
        WHEN 4 THEN 'رخصة قيادة'
        ELSE 'غير معروف'
    END AS identity_type,
    m.almustafid_identity,

    -- Jihat alaisdar (جهة الإصدار)
    ja.id   AS jihat_alaisdar_id,
    ja.name AS jihat_alaisdar_name,

    -- Wijhat altarhil (جهة الوصول)
    wt.id   AS wijhat_altarhil_id,
    wt.name AS wijhat_altarhil_name,

    -- Source state (الولاية)
    ss.id   AS source_state_id,
    ss.name AS source_state_name,
    ss.code AS source_state_code,

    -- Buyer
    m.almushtari_name,

    -- Parent record (self-join for renewals)
    p.id   AS parent_id,
    p.code AS parent_code,

    -- Created by / Updated by
    cb.username AS created_by_username,
    ub.username AS updated_by_username,

    -- Attachement
    CONCAT('https://mineralsgate.com/app/managers/gold_travel_traditional/appmovegoldtraditional/',m.id,'/change/') as "link",


    -- Aggregated total gold weight from details
    COALESCE(d.total_weight, 0) AS gold_weight_in_gram,

    -- Detail count
    COALESCE(d.detail_count, 0) AS detail_count

FROM gold_travel_traditional_appmovegoldtraditional m

-- Jihat alaisdar (جهة الإصدار)
LEFT JOIN gold_travel_traditional_lkpjihatalaisdar ja
    ON ja.id = m.jihat_alaisdar_id

-- Wijhat altarhil (جهة الوصول)
LEFT JOIN gold_travel_traditional_lkpjihataltarhil wt
    ON wt.id = m.wijhat_altarhil_id

-- Source state (الولاية)
LEFT JOIN company_profile_lkpstate ss
    ON ss.id = m.source_state_id

-- Parent record (self-join)
LEFT JOIN gold_travel_traditional_appmovegoldtraditional p
    ON p.id = m.parent_id

-- Created by
LEFT JOIN accounts_customuser cb
    ON cb.id = m.created_by_id

-- Updated by
LEFT JOIN accounts_customuser ub
    ON ub.id = m.updated_by_id

-- Details (aggregated)
LEFT JOIN (
    SELECT
        master_id,
        SUM(alloy_weight_gram) AS total_weight,
        COUNT(*)                AS detail_count
    FROM gold_travel_traditional_appmovegoldtraditionaldetail
    GROUP BY master_id
) d ON d.master_id = m.id

ORDER BY m.id DESC
