view: user_view {
  sql_table_name: `interviewdemo-359821.GASEIF14.UserView` ;;

  dimension: age {
    type: number
    sql: ${TABLE}.age ;;
  }
  dimension: email {
    type: string
    sql: ${TABLE}.email ;;
  }
  dimension: gender {
    type: string
    sql: ${TABLE}.gender ;;
  }
  dimension: location {
    type: string
    map_layer_name: countries
    sql: ${TABLE}.location ;;
  }

  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count_user {
    type: count
    drill_fields: [username]
  }

  measure: number_of_players {
    type: count_distinct
    sql: ${username} ;;
  }
}
