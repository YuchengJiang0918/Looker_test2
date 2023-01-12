# The name of this view in Looker is "Date Data"
view: date_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TMP"."DATE_DATA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Date" in Explore.

  dimension: date {
    type: string
    sql: ${TABLE}."DATE" ;;
  }

  dimension: datekey {
    type: string
    sql: ${TABLE}."DATEKEY" ;;
  }

  dimension: fiscal_quarter {
    type: string
    sql: ${TABLE}."FISCAL_QUARTER" ;;
  }

  dimension: fiscal_year {
    type: string
    sql: ${TABLE}."FISCAL_YEAR" ;;
  }

  dimension: full_date {
    type: string
    sql: ${TABLE}."FULL_DATE" ;;
  }

  dimension: month {
    type: string
    sql: ${TABLE}."MONTH" ;;
  }

  dimension: monthkey {
    type: string
    sql: ${TABLE}."MONTHKEY" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
