SELECT
  "source"."id" AS "id",
  "source"."created_at" AS "created_at",
  "source"."updated_at" AS "updated_at",
  "state"."name" AS "state",
  "app_name"."name" AS "app_ar",
  "source"."app_en" AS "app_en",
  "source"."company_id" AS "company_id",
  "source"."code" AS "code",
  "source"."name_ar" AS "name_ar",
  "source"."name_en" AS "name_en",
  "company_type"."name" AS "company_type",
  "company_type"."id" AS "company_type_id",
  FLOOR(EXTRACT(EPOCH FROM ("source"."updated_at" - "source"."created_at"))/3600)+1 as "kpi_hours"

FROM
  (
    (
      SELECT
        "company_profile_appcyanidecertificate"."id" AS "id",
        "company_profile_appcyanidecertificate"."created_at" AS "created_at",
        "company_profile_appcyanidecertificate"."updated_at" AS "updated_at",
        "company_profile_appcyanidecertificate"."company_id" AS "company_id",
        "company_profile_appcyanidecertificate"."state" AS "state",
        'Cyanide Certificate' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appcyanidecertificate"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appcyanidecertificate"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
     
ORDER BY
        "company_profile_appcyanidecertificate"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appexplosivepermission"."id" AS "id",
        "company_profile_appexplosivepermission"."created_at" AS "created_at",
        "company_profile_appexplosivepermission"."updated_at" AS "updated_at",
        "company_profile_appexplosivepermission"."company_id" AS "company_id",
        "company_profile_appexplosivepermission"."state" AS "state",
        'Explosive Permission' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appexplosivepermission"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appexplosivepermission"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appexplosivepermission"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appfuelpermission"."id" AS "id",
        "company_profile_appfuelpermission"."created_at" AS "created_at",
        "company_profile_appfuelpermission"."updated_at" AS "updated_at",
        "company_profile_appfuelpermission"."company_id" AS "company_id",
        "company_profile_appfuelpermission"."state" AS "state",
        'Fuel Permission' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appfuelpermission"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appfuelpermission"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appfuelpermission"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appimportpermission"."id" AS "id",
        "company_profile_appimportpermission"."created_at" AS "created_at",
        "company_profile_appimportpermission"."updated_at" AS "updated_at",
        "company_profile_appimportpermission"."company_id" AS "company_id",
        "company_profile_appimportpermission"."state" AS "state",
        'Import Permission' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appimportpermission"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appimportpermission"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appimportpermission"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appborrowmaterial"."id" AS "id",
        "company_profile_appborrowmaterial"."created_at" AS "created_at",
        "company_profile_appborrowmaterial"."updated_at" AS "updated_at",
        "company_profile_appborrowmaterial"."company_id" AS "company_id",
        "company_profile_appborrowmaterial"."state" AS "state",
        'BorrowMaterials' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appborrowmaterial"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appborrowmaterial"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appborrowmaterial"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appworkplan"."id" AS "id",
        "company_profile_appworkplan"."created_at" AS "created_at",
        "company_profile_appworkplan"."updated_at" AS "updated_at",
        "company_profile_appworkplan"."company_id" AS "company_id",
        "company_profile_appworkplan"."state" AS "state",
        'Work Plan' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appworkplan"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appworkplan"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appworkplan"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptechnicalfinancialreport"."id" AS "id",
        "company_profile_apptechnicalfinancialreport"."created_at" AS "created_at",
        "company_profile_apptechnicalfinancialreport"."updated_at" AS "updated_at",
        "company_profile_apptechnicalfinancialreport"."company_id" AS "company_id",
        "company_profile_apptechnicalfinancialreport"."state" AS "state",
        'Technical & Financial Report' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptechnicalfinancialreport"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptechnicalfinancialreport"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptechnicalfinancialreport"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appchangecompanyname"."id" AS "id",
        "company_profile_appchangecompanyname"."created_at" AS "created_at",
        "company_profile_appchangecompanyname"."updated_at" AS "updated_at",
        "company_profile_appchangecompanyname"."company_id" AS "company_id",
        "company_profile_appchangecompanyname"."state" AS "state",
        'Company Name Change' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appchangecompanyname"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appchangecompanyname"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appchangecompanyname"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appexplorationtime"."id" AS "id",
        "company_profile_appexplorationtime"."created_at" AS "created_at",
        "company_profile_appexplorationtime"."updated_at" AS "updated_at",
        "company_profile_appexplorationtime"."company_id" AS "company_id",
        "company_profile_appexplorationtime"."state" AS "state",
        'Exploration Time' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appexplorationtime"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appexplorationtime"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appexplorationtime"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appaddarea"."id" AS "id",
        "company_profile_appaddarea"."created_at" AS "created_at",
        "company_profile_appaddarea"."updated_at" AS "updated_at",
        "company_profile_appaddarea"."company_id" AS "company_id",
        "company_profile_appaddarea"."state" AS "state",
        'Add Area' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appaddarea"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appaddarea"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appaddarea"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appremovearea"."id" AS "id",
        "company_profile_appremovearea"."created_at" AS "created_at",
        "company_profile_appremovearea"."updated_at" AS "updated_at",
        "company_profile_appremovearea"."company_id" AS "company_id",
        "company_profile_appremovearea"."state" AS "state",
        'Remove Area' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appremovearea"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appremovearea"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appremovearea"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptnazolshraka"."id" AS "id",
        "company_profile_apptnazolshraka"."created_at" AS "created_at",
        "company_profile_apptnazolshraka"."updated_at" AS "updated_at",
        "company_profile_apptnazolshraka"."company_id" AS "company_id",
        "company_profile_apptnazolshraka"."state" AS "state",
        'Tnazol Shraka' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptnazolshraka"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptnazolshraka"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptnazolshraka"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptajeeltnazol"."id" AS "id",
        "company_profile_apptajeeltnazol"."created_at" AS "created_at",
        "company_profile_apptajeeltnazol"."updated_at" AS "updated_at",
        "company_profile_apptajeeltnazol"."company_id" AS "company_id",
        "company_profile_apptajeeltnazol"."state" AS "state",
        'Tajeel Tnazol' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptajeeltnazol"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptajeeltnazol"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptajeeltnazol"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptajmeed"."id" AS "id",
        "company_profile_apptajmeed"."created_at" AS "created_at",
        "company_profile_apptajmeed"."updated_at" AS "updated_at",
        "company_profile_apptajmeed"."company_id" AS "company_id",
        "company_profile_apptajmeed"."state" AS "state",
        'Tajmeed' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptajmeed"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptajmeed"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptajmeed"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptakhali"."id" AS "id",
        "company_profile_apptakhali"."created_at" AS "created_at",
        "company_profile_apptakhali"."updated_at" AS "updated_at",
        "company_profile_apptakhali"."company_id" AS "company_id",
        "company_profile_apptakhali"."state" AS "state",
        'Takhali' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptakhali"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptakhali"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptakhali"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptamdeed"."id" AS "id",
        "company_profile_apptamdeed"."created_at" AS "created_at",
        "company_profile_apptamdeed"."updated_at" AS "updated_at",
        "company_profile_apptamdeed"."company_id" AS "company_id",
        "company_profile_apptamdeed"."state" AS "state",
        'Tamdeed' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptamdeed"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptamdeed"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptamdeed"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apptaaweed"."id" AS "id",
        "company_profile_apptaaweed"."created_at" AS "created_at",
        "company_profile_apptaaweed"."updated_at" AS "updated_at",
        "company_profile_apptaaweed"."company_id" AS "company_id",
        "company_profile_apptaaweed"."state" AS "state",
        'Taaweed' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apptaaweed"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apptaaweed"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apptaaweed"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appmda"."id" AS "id",
        "company_profile_appmda"."created_at" AS "created_at",
        "company_profile_appmda"."updated_at" AS "updated_at",
        "company_profile_appmda"."company_id" AS "company_id",
        "company_profile_appmda"."state" AS "state",
        'MDA' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appmda"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appmda"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appmda"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appchangeworkprocedure"."id" AS "id",
        "company_profile_appchangeworkprocedure"."created_at" AS "created_at",
        "company_profile_appchangeworkprocedure"."updated_at" AS "updated_at",
        "company_profile_appchangeworkprocedure"."company_id" AS "company_id",
        "company_profile_appchangeworkprocedure"."state" AS "state",
        'Change Work Procedure' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appchangeworkprocedure"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appchangeworkprocedure"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appchangeworkprocedure"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appexportgold"."id" AS "id",
        "company_profile_appexportgold"."created_at" AS "created_at",
        "company_profile_appexportgold"."updated_at" AS "updated_at",
        "company_profile_appexportgold"."company_id" AS "company_id",
        "company_profile_appexportgold"."state" AS "state",
        'Export Gold' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appexportgold"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appexportgold"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appexportgold"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appexportgoldraw"."id" AS "id",
        "company_profile_appexportgoldraw"."created_at" AS "created_at",
        "company_profile_appexportgoldraw"."updated_at" AS "updated_at",
        "company_profile_appexportgoldraw"."company_id" AS "company_id",
        "company_profile_appexportgoldraw"."state" AS "state",
        'Export Gold Raw' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appexportgoldraw"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appexportgoldraw"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appexportgoldraw"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appsendsamplesforanalysis"."id" AS "id",
        "company_profile_appsendsamplesforanalysis"."created_at" AS "created_at",
        "company_profile_appsendsamplesforanalysis"."updated_at" AS "updated_at",
        "company_profile_appsendsamplesforanalysis"."company_id" AS "company_id",
        "company_profile_appsendsamplesforanalysis"."state" AS "state",
        'Send samples for analysis' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appsendsamplesforanalysis"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appsendsamplesforanalysis"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appsendsamplesforanalysis"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appforeignerprocedure"."id" AS "id",
        "company_profile_appforeignerprocedure"."created_at" AS "created_at",
        "company_profile_appforeignerprocedure"."updated_at" AS "updated_at",
        "company_profile_appforeignerprocedure"."company_id" AS "company_id",
        "company_profile_appforeignerprocedure"."state" AS "state",
        'Foreigner procedure' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appforeignerprocedure"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appforeignerprocedure"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appforeignerprocedure"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appaifaajomrki"."id" AS "id",
        "company_profile_appaifaajomrki"."created_at" AS "created_at",
        "company_profile_appaifaajomrki"."updated_at" AS "updated_at",
        "company_profile_appaifaajomrki"."company_id" AS "company_id",
        "company_profile_appaifaajomrki"."state" AS "state",
        'Aifaa Jomrki' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appaifaajomrki"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appaifaajomrki"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appaifaajomrki"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appvisibitystudy"."id" AS "id",
        "company_profile_appvisibitystudy"."created_at" AS "created_at",
        "company_profile_appvisibitystudy"."updated_at" AS "updated_at",
        "company_profile_appvisibitystudy"."company_id" AS "company_id",
        "company_profile_appvisibitystudy"."state" AS "state",
        'Visibity Study' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appvisibitystudy"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appvisibitystudy"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appvisibitystudy"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appreexportequipments"."id" AS "id",
        "company_profile_appreexportequipments"."created_at" AS "created_at",
        "company_profile_appreexportequipments"."updated_at" AS "updated_at",
        "company_profile_appreexportequipments"."company_id" AS "company_id",
        "company_profile_appreexportequipments"."state" AS "state",
        'Reexport Equipments' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appreexportequipments"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appreexportequipments"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appreexportequipments"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_apprequirementslist"."id" AS "id",
        "company_profile_apprequirementslist"."created_at" AS "created_at",
        "company_profile_apprequirementslist"."updated_at" AS "updated_at",
        "company_profile_apprequirementslist"."company_id" AS "company_id",
        "company_profile_apprequirementslist"."state" AS "state",
        'Requirements List' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_apprequirementslist"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_apprequirementslist"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_apprequirementslist"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_appwhomconcern"."id" AS "id",
        "company_profile_appwhomconcern"."created_at" AS "created_at",
        "company_profile_appwhomconcern"."updated_at" AS "updated_at",
        "company_profile_appwhomconcern"."company_id" AS "company_id",
        "company_profile_appwhomconcern"."state" AS "state",
        'Whom may concern request' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_appwhomconcern"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_appwhomconcern"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_appwhomconcern"."id" DESC
    )
    UNION
    (
      SELECT
        "company_profile_applocalpurchase"."id" AS "id",
        "company_profile_applocalpurchase"."created_at" AS "created_at",
        "company_profile_applocalpurchase"."updated_at" AS "updated_at",
        "company_profile_applocalpurchase"."company_id" AS "company_id",
        "company_profile_applocalpurchase"."state" AS "state",
        'Local Purchase' AS "app_en",
        "company_profile_tblcompanyproduction"."company_type" AS "company_type",
        "company_profile_tblcompanyproduction"."code" AS "code",
        "company_profile_tblcompanyproduction"."name_ar" AS "name_ar",
        "company_profile_tblcompanyproduction"."name_en" AS "name_en"
      FROM
        "company_profile_applocalpurchase"
        INNER JOIN "company_profile_tblcompanyproduction" ON (
          "company_profile_applocalpurchase"."company_id" = "company_profile_tblcompanyproduction"."id"
        )
      ORDER BY
        "company_profile_applocalpurchase"."id" DESC
    )
    ORDER BY
      "created_at" DESC
  ) AS "source"

    LEFT JOIN {{ ref('company_type') }} as "company_type" on "company_type"."id" = "source"."company_type"
    LEFT JOIN {{ ref('company_app_state')}} as "state" on "state"."id" = "source"."state"
    LEFT JOIN {{ ref('company_app_name')}} as "app_name" on "app_name"."id" = "source"."app_en"
