view: order_quantity_by_reseller_country_region {
  derived_table: {
    sql: SELECT
          reseller_data."COUNTRYREGION"  AS "reseller_data.countryregion",
          sum(sales_data."ORDER_QUANTITY")  AS "sales_data.order_quantity"
      FROM "TMP"."SALES_DATA"
           AS sales_data
      LEFT JOIN "TMP"."RESELLER_DATA"
           AS reseller_data ON sales_data.resellerkey = (reseller_data."RESELLERKEY")
      GROUP BY
          1
      ORDER BY
          1
      FETCH NEXT 500 ROWS ONLY
       ;;
  }

  measure: count {
    type: count
    drill_fields: [detail*]
  }

  dimension: reseller_data_countryregion {
    type: string
    sql: ${TABLE}."reseller_data.countryregion" ;;
  }

  dimension: sales_data_order_quantity {
    type: number
    sql: ${TABLE}."sales_data.order_quantity" ;;
  }

  set: detail {
    fields: [reseller_data_countryregion, sales_data_order_quantity]
  }
}
