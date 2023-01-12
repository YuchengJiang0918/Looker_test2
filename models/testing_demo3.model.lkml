# Define the database connection to be used for this model.
connection: "snowflake_test"

# Include all views
include: "/views/**/customer_data.view"
include: "/views/**/date_data.view"
include: "/views/**/product_data.view"
include: "/views/**/reseller_data.view"
include: "/views/**/sales_data.view"
include: "/views/**/sales_order_data.view"
include: "/views/**/sales_territory_data.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: testing_demo3_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: testing_demo3_default_datagroup

explore: sales_data {
  join: sales_territory_data {
    type: left_outer
    sql_on: ${sales_data.salesterritorykey} = ${sales_territory_data.salesterritorykey} ;;
    relationship: many_to_one
  }

  join: sales_order_data {
    type: full_outer
    sql_on: ${sales_data.salesorderlinekey} = ${sales_order_data.salesorderlinekey} ;;
    relationship: many_to_many
  }

  join: reseller_data {
    type: left_outer
    sql_on: ${sales_data.resellerkey} = ${reseller_data.resellerkey} ;;
    relationship: many_to_one
  }

  join: customer_data {
    type: left_outer
    sql_on: ${sales_data.customerkey} = ${customer_data.customerkey} ;;
    relationship: many_to_one
  }

  join: product_data {
    type: left_outer
    sql_on: ${sales_data.productkey} = ${product_data.productkey} ;;
    relationship: many_to_one
  }

  join: date_data {
    type: left_outer
    sql_on: ${sales_data.orderdatekey} = ${date_data.datekey} ;;
    relationship: many_to_one
  }
}
