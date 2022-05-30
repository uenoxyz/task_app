ActiveRecord::Schema[7.0].define(version: 2022_05_30_104554) do
  create_table "posts", force: :cascade do |t|
    t.string "title"
    t.date "start_day"
    t.date "end_day"
    t.boolean "all_day"
    t.text "memo"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
