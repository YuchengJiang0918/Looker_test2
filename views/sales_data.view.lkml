# The name of this view in Looker is "Sales Data"
view: sales_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TMP"."SALES_DATA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Customerkey" in Explore.

  dimension: customerkey {
    type: string
    sql: ${TABLE}."CUSTOMERKEY" ;;
  }

  dimension: duedatekey {
    type: string
    sql: ${TABLE}."DUEDATEKEY" ;;
  }

  dimension: extended_amount {
    type: string
    sql: ${TABLE}."EXTENDED_AMOUNT" ;;
  }

  dimension: order_quantity {
    type: number
    sql: ${TABLE}."ORDER_QUANTITY" ;;
  }

  dimension: orderdatekey {
    type: string
    sql: ${TABLE}."ORDERDATEKEY" ;;
  }

  dimension: product_standard_cost {
    type: number
    sql: ${TABLE}."PRODUCT_STANDARD_COST" ;;
  }

  dimension: productkey {
    type: string
    sql: ${TABLE}."PRODUCTKEY" ;;
  }

  dimension: resellerkey {
    type: string
    sql: ${TABLE}."RESELLERKEY" ;;
  }

  dimension: sales_amount {
    type: number
    sql: ${TABLE}."SALES_AMOUNT" ;;
  }

  dimension: salesorderlinekey {
    type: string
    sql: ${TABLE}."SALESORDERLINEKEY" ;;
  }

  dimension: salesterritorykey {
    type: string
    sql: ${TABLE}."SALESTERRITORYKEY" ;;
  }

  dimension: shipdatekey {
    type: string
    sql: ${TABLE}."SHIPDATEKEY" ;;
  }

  dimension: total_product_cost {
    type: string
    sql: ${TABLE}."TOTAL_PRODUCT_COST" ;;
  }

  dimension: unit_price {
    type: string
    sql: ${TABLE}."UNIT_PRICE" ;;
  }

  dimension: unit_price_discount_pct {
    type: string
    sql: ${TABLE}."UNIT_PRICE_DISCOUNT_PCT" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
