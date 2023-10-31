connection: "demo"

include: "/views/*.view.lkml"                # include all views in the views/ folder in this project

explore: plays {
  join: user_view {
    relationship: many_to_one
    sql_on: ${plays.username}=${user_view.username} ;;
  }
}
