# The name of this view in Looker is "Customer Data"
view: customer_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TMP"."CUSTOMER_DATA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "City" in Explore.

  dimension: city {
    type: string
    sql: ${TABLE}."CITY" ;;
  }

  dimension: countryregion {
    type: string
    sql: ${TABLE}."COUNTRYREGION" ;;
  }

  dimension: customer {
    type: string
    sql: ${TABLE}."CUSTOMER" ;;
  }

  dimension: customer_id {
    type: string
    sql: ${TABLE}."CUSTOMER_ID" ;;
  }

  dimension: customerkey {
    type: string
    sql: ${TABLE}."CUSTOMERKEY" ;;
  }

  dimension: postal_code {
    type: string
    sql: ${TABLE}."POSTAL_CODE" ;;
  }

  dimension: stateprovince {
    type: string
    sql: ${TABLE}."STATEPROVINCE" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
