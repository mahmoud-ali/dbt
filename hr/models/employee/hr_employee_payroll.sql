SELECT
  "emp".*,
  make_date("master"."year", "master"."month", 27) AS "date",
  "payroll"."total_salary",
  "payroll"."net_salary",
  "payroll"."mokaf2",
  "payroll"."salary_mokaf2"

FROM
  "public"."hr_payrollsummary" as "payroll"
LEFT JOIN "public"."hr_payrollmaster" as "master" ON "master"."id" = "payroll"."payroll_master_id" 
LEFT JOIN {{ ref('hr_employee')}} as "emp" ON "emp"."id" = "payroll"."employee_id" 
