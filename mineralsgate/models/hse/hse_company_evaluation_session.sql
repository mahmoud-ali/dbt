WITH env_scores AS (
  SELECT
    session_id,
    env_mercury_condenser_smelting,
    env_mercury_condenser_cell,
    env_sanitation_system,
    env_containment_basins,
    env_cyanide_mixer,
    env_solution_connections_safety,
    env_solution_basins_insulation,
    env_noise_control_mechanism,
    env_dust_control_mechanism,
    env_tailings_storage,
    env_basins_fencing,
    env_landfill,
    (
      (CASE WHEN env_mercury_condenser_smelting > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_mercury_condenser_cell > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_sanitation_system > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_containment_basins > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_cyanide_mixer > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_solution_connections_safety > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_solution_basins_insulation > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_noise_control_mechanism > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_dust_control_mechanism > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_tailings_storage > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_basins_fencing > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN env_landfill > 0 THEN 1 ELSE 0 END)
    ) AS env_valid_count,
    (
      (CASE WHEN env_mercury_condenser_smelting > 0 THEN env_mercury_condenser_smelting ELSE 0 END) +
      (CASE WHEN env_mercury_condenser_cell > 0 THEN env_mercury_condenser_cell ELSE 0 END) +
      (CASE WHEN env_sanitation_system > 0 THEN env_sanitation_system ELSE 0 END) +
      (CASE WHEN env_containment_basins > 0 THEN env_containment_basins ELSE 0 END) +
      (CASE WHEN env_cyanide_mixer > 0 THEN env_cyanide_mixer ELSE 0 END) +
      (CASE WHEN env_solution_connections_safety > 0 THEN env_solution_connections_safety ELSE 0 END) +
      (CASE WHEN env_solution_basins_insulation > 0 THEN env_solution_basins_insulation ELSE 0 END) +
      (CASE WHEN env_noise_control_mechanism > 0 THEN env_noise_control_mechanism ELSE 0 END) +
      (CASE WHEN env_dust_control_mechanism > 0 THEN env_dust_control_mechanism ELSE 0 END) +
      (CASE WHEN env_tailings_storage > 0 THEN env_tailings_storage ELSE 0 END) +
      (CASE WHEN env_basins_fencing > 0 THEN env_basins_fencing ELSE 0 END) +
      (CASE WHEN env_landfill > 0 THEN env_landfill ELSE 0 END)
    ) AS env_sum_score
  FROM "public"."hse_companies_tblcompanyevaluationenvironment"
),

safe_scores AS (
  SELECT
    safe.session_id,
    safe.safe_mine_barriers,
    safe.safe_mine_faces,
    safe.safe_mine_lighting,
    safe.safe_food_storage,
    safe.safe_kitchen,
    safe.safe_dining_hall,
    safe.safe_meals,
    safe.safe_accommodation_rooms,
    safe.safe_accommodation_toilets,
    safe.safe_drinking_water_quality,
    safe.safe_hcn_detector,
    safe.safe_smelting_room_compliance,
    safe.safe_chemical_storage_compliance,
    safe.safe_cyanide_storage_compliance,
    safe.safe_vehicles_machinery_safety,
    safe.safe_work_environment_quality,
    safe.safe_specialized_training,
    safe.safe_electrical_connections_safety,
    safe.safe_ppe,
    safe.safe_ptw,
    safe.safe_safety_signs,
    safe.safe_initial_medical_check,
    safe.safe_periodic_medical_check,
    safe.safe_first_aid_boxes,
    safe.safe_firefighting_system,
    safe.safe_health_unit,
    (
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_barriers > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_faces > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_lighting > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_food_storage > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_kitchen > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_dining_hall > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_meals > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_accommodation_rooms > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_accommodation_toilets > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_drinking_water_quality > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_hcn_detector > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_smelting_room_compliance > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_chemical_storage_compliance > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_cyanide_storage_compliance > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_vehicles_machinery_safety > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_work_environment_quality > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_specialized_training > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_electrical_connections_safety > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_ppe > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_ptw > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_safety_signs > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_initial_medical_check > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_periodic_medical_check > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_first_aid_boxes > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_firefighting_system > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN safe.safe_health_unit > 0 THEN 1 ELSE 0 END)
    ) AS safe_valid_count,
    (
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_barriers > 0 THEN safe.safe_mine_barriers ELSE 0 END) +
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_faces > 0 THEN safe.safe_mine_faces ELSE 0 END) +
      (CASE WHEN COALESCE(comp.company_type, '') <> 'mokhalfat' AND safe.safe_mine_lighting > 0 THEN safe.safe_mine_lighting ELSE 0 END) +
      (CASE WHEN safe.safe_food_storage > 0 THEN safe.safe_food_storage ELSE 0 END) +
      (CASE WHEN safe.safe_kitchen > 0 THEN safe.safe_kitchen ELSE 0 END) +
      (CASE WHEN safe.safe_dining_hall > 0 THEN safe.safe_dining_hall ELSE 0 END) +
      (CASE WHEN safe.safe_meals > 0 THEN safe.safe_meals ELSE 0 END) +
      (CASE WHEN safe.safe_accommodation_rooms > 0 THEN safe.safe_accommodation_rooms ELSE 0 END) +
      (CASE WHEN safe.safe_accommodation_toilets > 0 THEN safe.safe_accommodation_toilets ELSE 0 END) +
      (CASE WHEN safe.safe_drinking_water_quality > 0 THEN safe.safe_drinking_water_quality ELSE 0 END) +
      (CASE WHEN safe.safe_hcn_detector > 0 THEN safe.safe_hcn_detector ELSE 0 END) +
      (CASE WHEN safe.safe_smelting_room_compliance > 0 THEN safe.safe_smelting_room_compliance ELSE 0 END) +
      (CASE WHEN safe.safe_chemical_storage_compliance > 0 THEN safe.safe_chemical_storage_compliance ELSE 0 END) +
      (CASE WHEN safe.safe_cyanide_storage_compliance > 0 THEN safe.safe_cyanide_storage_compliance ELSE 0 END) +
      (CASE WHEN safe.safe_vehicles_machinery_safety > 0 THEN safe.safe_vehicles_machinery_safety ELSE 0 END) +
      (CASE WHEN safe.safe_work_environment_quality > 0 THEN safe.safe_work_environment_quality ELSE 0 END) +
      (CASE WHEN safe.safe_specialized_training > 0 THEN safe.safe_specialized_training ELSE 0 END) +
      (CASE WHEN safe.safe_electrical_connections_safety > 0 THEN safe.safe_electrical_connections_safety ELSE 0 END) +
      (CASE WHEN safe.safe_ppe > 0 THEN safe.safe_ppe ELSE 0 END) +
      (CASE WHEN safe.safe_ptw > 0 THEN safe.safe_ptw ELSE 0 END) +
      (CASE WHEN safe.safe_safety_signs > 0 THEN safe.safe_safety_signs ELSE 0 END) +
      (CASE WHEN safe.safe_initial_medical_check > 0 THEN safe.safe_initial_medical_check ELSE 0 END) +
      (CASE WHEN safe.safe_periodic_medical_check > 0 THEN safe.safe_periodic_medical_check ELSE 0 END) +
      (CASE WHEN safe.safe_first_aid_boxes > 0 THEN safe.safe_first_aid_boxes ELSE 0 END) +
      (CASE WHEN safe.safe_firefighting_system > 0 THEN safe.safe_firefighting_system ELSE 0 END) +
      (CASE WHEN safe.safe_health_unit > 0 THEN safe.safe_health_unit ELSE 0 END)
    ) AS safe_sum_score
  FROM "public"."hse_companies_tblcompanyevaluationsafety" AS safe
  LEFT JOIN "public"."hse_companies_tblcompanyevaluationsession" AS sess ON safe.session_id = sess.id
  LEFT JOIN "public"."company_profile_tblcompanyproduction" AS comp ON sess.company_id = comp.id
),

gen_scores AS (
  SELECT
    session_id,
    gen_monthly_reports_commitment,
    gen_corrective_actions_commitment,
    gen_company_site_fencing,
    gen_waste_management_plan,
    gen_emergency_plan,
    gen_hse_plan,
    gen_hse_policy,
    gen_esia,
    gen_qualified_hse_officer,
    (
      (CASE WHEN gen_monthly_reports_commitment > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_corrective_actions_commitment > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_company_site_fencing > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_waste_management_plan > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_emergency_plan > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_hse_plan > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_hse_policy > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_esia > 0 THEN 1 ELSE 0 END) +
      (CASE WHEN gen_qualified_hse_officer > 0 THEN 1 ELSE 0 END)
    ) AS gen_valid_count,
    (
      (CASE WHEN gen_monthly_reports_commitment > 0 THEN gen_monthly_reports_commitment ELSE 0 END) +
      (CASE WHEN gen_corrective_actions_commitment > 0 THEN gen_corrective_actions_commitment ELSE 0 END) +
      (CASE WHEN gen_company_site_fencing > 0 THEN gen_company_site_fencing ELSE 0 END) +
      (CASE WHEN gen_waste_management_plan > 0 THEN gen_waste_management_plan ELSE 0 END) +
      (CASE WHEN gen_emergency_plan > 0 THEN gen_emergency_plan ELSE 0 END) +
      (CASE WHEN gen_hse_plan > 0 THEN gen_hse_plan ELSE 0 END) +
      (CASE WHEN gen_hse_policy > 0 THEN gen_hse_policy ELSE 0 END) +
      (CASE WHEN gen_esia > 0 THEN gen_esia ELSE 0 END) +
      (CASE WHEN gen_qualified_hse_officer > 0 THEN gen_qualified_hse_officer ELSE 0 END)
    ) AS gen_sum_score
  FROM "public"."hse_companies_tblcompanyevaluationgeneral"
),

session_metrics AS (
  SELECT
    sess.id AS session_id,
    sess.company_id,
    sess.state_id,
    sess.locality_id,
    sess.evaluation_date,
    sess.created_at,
    sess.updated_at,
    
    -- All Environment Detail Fields
    env.env_mercury_condenser_smelting,
    env.env_mercury_condenser_cell,
    env.env_sanitation_system,
    env.env_containment_basins,
    env.env_cyanide_mixer,
    env.env_solution_connections_safety,
    env.env_solution_basins_insulation,
    env.env_noise_control_mechanism,
    env.env_dust_control_mechanism,
    env.env_tailings_storage,
    env.env_basins_fencing,
    env.env_landfill,

    -- Environment Averages & Percentages
    env.env_valid_count,
    env.env_sum_score,
    ROUND((env.env_sum_score::numeric / NULLIF(env.env_valid_count, 0)), 2) AS env_avg_score,
    ROUND((ROUND((env.env_sum_score::numeric / NULLIF(env.env_valid_count, 0)), 2) / 3.0) * 100, 1) AS env_percentage,

    -- All Safety Detail Fields
    safe.safe_mine_barriers,
    safe.safe_mine_faces,
    safe.safe_mine_lighting,
    safe.safe_food_storage,
    safe.safe_kitchen,
    safe.safe_dining_hall,
    safe.safe_meals,
    safe.safe_accommodation_rooms,
    safe.safe_accommodation_toilets,
    safe.safe_drinking_water_quality,
    safe.safe_hcn_detector,
    safe.safe_smelting_room_compliance,
    safe.safe_chemical_storage_compliance,
    safe.safe_cyanide_storage_compliance,
    safe.safe_vehicles_machinery_safety,
    safe.safe_work_environment_quality,
    safe.safe_specialized_training,
    safe.safe_electrical_connections_safety,
    safe.safe_ppe,
    safe.safe_ptw,
    safe.safe_safety_signs,
    safe.safe_initial_medical_check,
    safe.safe_periodic_medical_check,
    safe.safe_first_aid_boxes,
    safe.safe_firefighting_system,
    safe.safe_health_unit,

    -- Safety Averages & Percentages
    safe.safe_valid_count,
    safe.safe_sum_score,
    ROUND((safe.safe_sum_score::numeric / NULLIF(safe.safe_valid_count, 0)), 2) AS safe_avg_score,
    ROUND((ROUND((safe.safe_sum_score::numeric / NULLIF(safe.safe_valid_count, 0)), 2) / 3.0) * 100, 1) AS safe_percentage,

    -- All General Requirement Detail Fields
    gen.gen_monthly_reports_commitment,
    gen.gen_corrective_actions_commitment,
    gen.gen_company_site_fencing,
    gen.gen_waste_management_plan,
    gen.gen_emergency_plan,
    gen.gen_hse_plan,
    gen.gen_hse_policy,
    gen.gen_esia,
    gen.gen_qualified_hse_officer,

    -- General Requirements Averages & Percentages
    gen.gen_valid_count,
    gen.gen_sum_score,
    ROUND((gen.gen_sum_score::numeric / NULLIF(gen.gen_valid_count, 0)), 2) AS gen_avg_score,
    ROUND((ROUND((gen.gen_sum_score::numeric / NULLIF(gen.gen_valid_count, 0)), 2) / 3.0) * 100, 1) AS gen_percentage

  FROM "public"."hse_companies_tblcompanyevaluationsession" AS sess
  LEFT JOIN env_scores AS env ON env.session_id = sess.id
  LEFT JOIN safe_scores AS safe ON safe.session_id = sess.id
  LEFT JOIN gen_scores AS gen ON gen.session_id = sess.id
)

SELECT
  m.session_id,
  m.evaluation_date,
  
  -- Company Information
  comp.id AS company_id,
  comp.name_ar AS company_name_ar,
  comp.name_en AS company_name_en,
  comp.company_type AS company_type,
  comp.code AS company_code,
  comp.company_status AS company_status,
  
  -- Location Information
  state.name AS state_name,
  locality.name AS locality_name,

  -- Environment Criteria Details
  m.env_mercury_condenser_smelting,
  m.env_mercury_condenser_cell,
  m.env_sanitation_system,
  m.env_containment_basins,
  m.env_cyanide_mixer,
  m.env_solution_connections_safety,
  m.env_solution_basins_insulation,
  m.env_noise_control_mechanism,
  m.env_dust_control_mechanism,
  m.env_tailings_storage,
  m.env_basins_fencing,
  m.env_landfill,

  -- Environment Axis Summary
  m.env_avg_score,
  m.env_percentage,

  -- Safety Criteria Details
  m.safe_mine_barriers,
  m.safe_mine_faces,
  m.safe_mine_lighting,
  m.safe_food_storage,
  m.safe_kitchen,
  m.safe_dining_hall,
  m.safe_meals,
  m.safe_accommodation_rooms,
  m.safe_accommodation_toilets,
  m.safe_drinking_water_quality,
  m.safe_hcn_detector,
  m.safe_smelting_room_compliance,
  m.safe_chemical_storage_compliance,
  m.safe_cyanide_storage_compliance,
  m.safe_vehicles_machinery_safety,
  m.safe_work_environment_quality,
  m.safe_specialized_training,
  m.safe_electrical_connections_safety,
  m.safe_ppe,
  m.safe_ptw,
  m.safe_safety_signs,
  m.safe_initial_medical_check,
  m.safe_periodic_medical_check,
  m.safe_first_aid_boxes,
  m.safe_firefighting_system,
  m.safe_health_unit,

  -- Safety Axis Summary
  m.safe_avg_score,
  m.safe_percentage,

  -- General Requirement Criteria Details
  m.gen_monthly_reports_commitment,
  m.gen_corrective_actions_commitment,
  m.gen_company_site_fencing,
  m.gen_waste_management_plan,
  m.gen_emergency_plan,
  m.gen_hse_plan,
  m.gen_hse_policy,
  m.gen_esia,
  m.gen_qualified_hse_officer,

  -- General Requirement Axis Summary
  m.gen_avg_score,
  m.gen_percentage,

  -- Overall Total Score & Percentage
  ROUND(
    (
      COALESCE(m.env_avg_score, 0) +
      COALESCE(m.safe_avg_score, 0) +
      COALESCE(m.gen_avg_score, 0)
    ) / NULLIF(
      (CASE WHEN m.env_avg_score > 0 THEN 1 ELSE 0 END +
       CASE WHEN m.safe_avg_score > 0 THEN 1 ELSE 0 END +
       CASE WHEN m.gen_avg_score > 0 THEN 1 ELSE 0 END), 0
    ), 2
  ) AS overall_avg_score,

  ROUND(
    (
      ROUND(
        (
          COALESCE(m.env_avg_score, 0) +
          COALESCE(m.safe_avg_score, 0) +
          COALESCE(m.gen_avg_score, 0)
        ) / NULLIF(
          (CASE WHEN m.env_avg_score > 0 THEN 1 ELSE 0 END +
           CASE WHEN m.safe_avg_score > 0 THEN 1 ELSE 0 END +
           CASE WHEN m.gen_avg_score > 0 THEN 1 ELSE 0 END), 0
        ), 2
      ) / 3.0
    ) * 100, 1
  ) AS overall_percentage,

  m.created_at,
  m.updated_at

FROM session_metrics AS m
LEFT JOIN {{ ref('company') }} AS comp ON m.company_id = comp.id
LEFT JOIN "public"."company_profile_lkpstate" AS state ON m.state_id = state.id
LEFT JOIN "public"."company_profile_lkplocality" AS locality ON m.locality_id = locality.id
