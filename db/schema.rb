# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# This file is the source Rails uses to define your schema when running `bin/rails
# db:schema:load`. When creating a new database, `bin/rails db:schema:load` tends to
# be faster and is potentially less error prone than running all of your
# migrations from scratch. Old migrations may fail to apply correctly if those
# migrations use external dependencies or application code.
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2022_10_22_005929) do

  create_table "accounts", force: :cascade do |t|
    t.string "number"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.integer "user_id"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["user_id"], name: "index_accounts_on_user_id", unique: true
  end

  create_table "history_balances", force: :cascade do |t|
    t.integer "transaction_id"
    t.bigint "balancetable_id"
    t.string "balancetable_type"
    t.decimal "balance_before"
    t.decimal "balance_after"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["transaction_id"], name: "index_history_balances_on_transaction_id"
  end

  create_table "stocks", force: :cascade do |t|
    t.string "name"
    t.string "code"
    t.string "types"
    t.decimal "balance", precision: 5, scale: 2, default: "0.0", null: false
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  create_table "transactions", force: :cascade do |t|
    t.decimal "amount", precision: 5, scale: 2, default: "0.0", null: false
    t.bigint "source_id"
    t.string "source_type"
    t.bigint "target_id"
    t.string "target_type"
    t.string "types"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
    t.index ["source_id", "source_type"], name: "index_transactions_on_source_id_and_source_type"
    t.index ["target_id", "target_type"], name: "index_transactions_on_target_id_and_target_type"
  end

  create_table "users", force: :cascade do |t|
    t.string "name"
    t.string "phone_number"
    t.date "birth_date"
    t.datetime "created_at", precision: 6, null: false
    t.datetime "updated_at", precision: 6, null: false
  end

  add_foreign_key "accounts", "users"
end
