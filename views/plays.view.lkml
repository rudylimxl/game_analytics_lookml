view: plays {
  sql_table_name: `interviewdemo-359821.GASEIF14.Plays` ;;
  drill_fields: [play_id]

  dimension: play_id {
    primary_key: yes
    type: number
    sql: ${TABLE}.play_id ;;
  }
  dimension: clear_sequence {
    type: string
    sql: ${TABLE}.clear_sequence ;;
  }
  dimension: game_complete {
    type: yesno
    sql: ${TABLE}.game_complete ;;
  }
  dimension: moves_to_win {
    type: number
    sql: ${TABLE}.moves_to_win ;;
  }
  dimension_group: play_datetime {
    type: time
    timeframes: [raw, time, date, week, month, quarter, year]
    sql: ${TABLE}.play_datetime ;;
  }
  dimension: sequence {
    type: string
    sql: ${TABLE}.sequence ;;
  }
  dimension: user_id {
    type: number
    sql: ${TABLE}.user_id ;;
  }
  dimension: username {
    type: string
    sql: ${TABLE}.username ;;
  }
  measure: count {
    type: count
    drill_fields: [play_id, username]
  }

  measure: completion_rate{
    type: number
    sql: sum(if(${game_complete},1,0))/sum(1);;
    value_format_name: percent_1
  }

  measure: avg_moves_to_win {
    type: average
    value_format_name: decimal_1
    sql: ${moves_to_win} ;;
  }
}
