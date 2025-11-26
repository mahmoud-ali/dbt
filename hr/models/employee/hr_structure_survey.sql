SELECT
structure_survey.wilaya ,
structure_survey.work_duration,
structure_survey.clarity_statement,
structure_survey.roles_responsibilities,
structure_survey.communication_lines,
structure_survey.job_title_match,
structure_survey.decision_making,
structure_survey.coordination,
structure_survey.service_quality,
structure_survey.strategic_alignment,
structure_survey.adaptability,
structure_survey.resource_allocation,
structure_survey.service_delivery,
structure_survey.challenges,
structure_survey.suitability,
structure_survey.improvements,
hr_mosamawazifi.name AS mosamawazifi

FROM public.hr_employee_survey_surveyresponse AS structure_survey
LEFT JOIN public.hr_mosamawazifi AS hr_mosamawazifi ON structure_survey.position_id = hr_mosamawazifi.id



