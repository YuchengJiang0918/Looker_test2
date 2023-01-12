# The name of this view in Looker is "Product Data"
view: product_data {
  # The sql_table_name parameter indicates the underlying database table
  # to be used for all fields in this view.
  sql_table_name: "TMP"."PRODUCT_DATA"
    ;;
  # No primary key is defined for this view. In order to join this view in an Explore,
  # define primary_key: yes on a dimension that has no repeated values.

  # Here's what a typical dimension looks like in LookML.
  # A dimension is a groupable field that can be used to filter query results.
  # This dimension will be called "Category" in Explore.

  dimension: category {
    type: string
    sql: ${TABLE}."CATEGORY" ;;
  }

  dimension: color {
    type: string
    sql: ${TABLE}."COLOR" ;;
  }

  dimension: list_price {
    type: string
    sql: ${TABLE}."LIST_PRICE" ;;
  }

  dimension: model {
    type: string
    sql: ${TABLE}."MODEL" ;;
  }

  dimension: product {
    type: string
    sql: ${TABLE}."PRODUCT" ;;
  }

  dimension: productkey {
    type: string
    sql: ${TABLE}."PRODUCTKEY" ;;
  }

  dimension: sku {
    type: string
    sql: ${TABLE}."SKU" ;;
  }

  dimension: standard_cost {
    type: string
    sql: ${TABLE}."STANDARD_COST" ;;
  }

  dimension: subcategory {
    type: string
    sql: ${TABLE}."SUBCATEGORY" ;;
  }

  measure: count {
    type: count
    drill_fields: []
  }
}
