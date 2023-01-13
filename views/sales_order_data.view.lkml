# The name of this view in Looker is "Adventureworks Sales"
view: sales_order_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TMP"."ADVENTUREWORKS_SALES"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Channel" in Explore.

  dimension: channel {
    type: string
    sql: ${TABLE}."CHANNEL" ;;
  }

  dimension: sales_order {
    type: string
    sql: ${TABLE}."SALES_ORDER" ;;
  }

  dimension: sales_order_line {
    type: string
    sql: ${TABLE}."SALES_ORDER_LINE" ;;
  }

  dimension: salesorderlinekey {
    type: number
    sql: ${TABLE}."SALESORDERLINEKEY" ;;
    primary_key: yes
  }

  # A measure is a field that uses a SQL aggregate function. Here are defined sum and average
  # measures for this dimension, but you can also add measures of many different aggregates.
  # Click on the type parameter to see all the options in the Quick Help panel on the right.

  measure: total_salesorderlinekey {
    type: sum
    sql: ${salesorderlinekey} ;;
  }

  measure: average_salesorderlinekey {
    type: average
    sql: ${salesorderlinekey} ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
