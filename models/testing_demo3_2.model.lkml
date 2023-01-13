# Define the database connection to be used for this model.
connection: "snowflake_test"

# include all the views
include: "/views/**/*.view"

# Datagroups define a caching policy for an Explore. To learn more,
# use the Quick Help panel on the right to see documentation.

datagroup: testing_demo3_2_default_datagroup {
  # sql_trigger: SELECT MAX(id) FROM etl_log;;
  max_cache_age: "1 hour"
}

persist_with: testing_demo3_2_default_datagroup

# Explores allow you to join together different views (database tables) based on the
# relationships between fields. By joining a view into an Explore, you make those
# fields available to users for data analysis.
# Explores should be purpose-built for specific use cases.

# To see the Explore you’re building, navigate to the Explore menu and select an Explore under "Testing Demo3 2"

# To create more sophisticated Explores that involve multiple views, you can use the join parameter.
# Typically, join parameters require that you define the join type, join relationship, and a sql_on clause.
# Each joined view also needs to define a primary key.


explore: customer_data {}

explore: date_data {}

explore: product_data {}

explore: reseller_data {}

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

explore: sales_order_data {}

explore: sales_territory_data {}
