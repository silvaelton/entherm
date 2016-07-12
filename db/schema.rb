# encoding: UTF-8
# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20160711145740) do

  create_table "commercial_companies", force: :cascade do |t|
    t.string   "name"
    t.string   "cnpj"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "address"
    t.string   "address_complement"
    t.string   "cep"
    t.string   "telephone"
    t.string   "telephone_optional"
    t.datetime "created_at",         null: false
    t.datetime "updated_at",         null: false
  end

  add_index "commercial_companies", ["city_id"], name: "index_commercial_companies_on_city_id"
  add_index "commercial_companies", ["state_id"], name: "index_commercial_companies_on_state_id"

  create_table "commercial_contracts", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",     default: true
    t.integer  "company_id"
    t.datetime "created_at",                null: false
    t.datetime "updated_at",                null: false
  end

  add_index "commercial_contracts", ["company_id"], name: "index_commercial_contracts_on_company_id"

  create_table "deal_inventories", force: :cascade do |t|
    t.integer  "product_id"
    t.integer  "quantity"
    t.string   "unit"
    t.text     "observation"
    t.text     "location"
    t.string   "image_path"
    t.string   "state"
    t.string   "supplier"
    t.float    "estimed_value"
    t.integer  "purchase_id"
    t.datetime "created_at",    null: false
    t.datetime "updated_at",    null: false
  end

  add_index "deal_inventories", ["product_id"], name: "index_deal_inventories_on_product_id"
  add_index "deal_inventories", ["purchase_id"], name: "index_deal_inventories_on_purchase_id"

  create_table "deal_inventory_logs", force: :cascade do |t|
    t.integer  "log_type"
    t.integer  "quantity"
    t.integer  "user_id"
    t.string   "name"
    t.string   "description"
    t.integer  "inventory_id"
    t.datetime "created_at",   null: false
    t.datetime "updated_at",   null: false
    t.integer  "contract_id"
  end

  add_index "deal_inventory_logs", ["contract_id"], name: "index_deal_inventory_logs_on_contract_id"
  add_index "deal_inventory_logs", ["inventory_id"], name: "index_deal_inventory_logs_on_inventory_id"
  add_index "deal_inventory_logs", ["user_id"], name: "index_deal_inventory_logs_on_user_id"

  create_table "deal_order_comments", force: :cascade do |t|
    t.integer  "user_id"
    t.text     "content"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer  "order_id"
  end

  add_index "deal_order_comments", ["order_id"], name: "index_deal_order_comments_on_order_id"
  add_index "deal_order_comments", ["user_id"], name: "index_deal_order_comments_on_user_id"

  create_table "deal_order_items", force: :cascade do |t|
    t.integer  "order_id"
    t.integer  "product_id"
    t.string   "unit"
    t.integer  "quantity"
    t.string   "goal"
    t.text     "observation"
    t.datetime "created_at",      null: false
    t.datetime "updated_at",      null: false
    t.string   "machine_id"
    t.string   "machine_version"
    t.string   "machine_serial"
    t.float    "contract_value"
  end

  add_index "deal_order_items", ["order_id"], name: "index_deal_order_items_on_order_id"
  add_index "deal_order_items", ["product_id"], name: "index_deal_order_items_on_product_id"

  create_table "deal_orders", force: :cascade do |t|
    t.integer  "user_id"
    t.integer  "contract_id"
    t.text     "description"
    t.integer  "status",      default: 0
    t.string   "image_path"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
    t.string   "pdf"
  end

  add_index "deal_orders", ["contract_id"], name: "index_deal_orders_on_contract_id"
  add_index "deal_orders", ["user_id"], name: "index_deal_orders_on_user_id"

  create_table "deal_patrimonies", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.string   "image_path"
    t.string   "location"
    t.float    "estimated_value"
    t.float    "original_value"
    t.integer  "state",           default: 0
    t.integer  "contract_id"
    t.datetime "created_at",                  null: false
    t.datetime "updated_at",                  null: false
    t.integer  "unit"
    t.date     "devolution_date"
    t.string   "number"
    t.string   "note_number"
    t.string   "responsible"
    t.integer  "quantity"
    t.string   "code"
    t.date     "buy_date"
  end

  add_index "deal_patrimonies", ["contract_id"], name: "index_deal_patrimonies_on_contract_id"

  create_table "deal_patrimony_moviments", force: :cascade do |t|
    t.integer  "origin_contract_id"
    t.integer  "current_contract_id"
    t.string   "responsible"
    t.integer  "items_id"
    t.integer  "moviment_type"
    t.integer  "user_id"
    t.text     "observation"
    t.datetime "created_at",          null: false
    t.datetime "updated_at",          null: false
  end

  add_index "deal_patrimony_moviments", ["current_contract_id"], name: "index_deal_patrimony_moviments_on_current_contract_id"
  add_index "deal_patrimony_moviments", ["origin_contract_id"], name: "index_deal_patrimony_moviments_on_origin_contract_id"
  add_index "deal_patrimony_moviments", ["user_id"], name: "index_deal_patrimony_moviments_on_user_id"

  create_table "deal_products", force: :cascade do |t|
    t.string   "title"
    t.text     "description"
    t.text     "observation"
    t.string   "image_path"
    t.datetime "created_at",  null: false
    t.datetime "updated_at",  null: false
  end

  create_table "deal_purchase_items", force: :cascade do |t|
    t.integer  "purchase_id"
    t.integer  "product_id"
    t.integer  "quantity",       default: 0
    t.integer  "unit",           default: 0
    t.float    "unit_value",     default: 0.0
    t.float    "total_value",    default: 0.0
    t.float    "contract_value", default: 0.0
    t.text     "observation"
    t.datetime "created_at",                   null: false
    t.datetime "updated_at",                   null: false
  end

  add_index "deal_purchase_items", ["product_id"], name: "index_deal_purchase_items_on_product_id"
  add_index "deal_purchase_items", ["purchase_id"], name: "index_deal_purchase_items_on_purchase_id"

  create_table "deal_purchases", force: :cascade do |t|
    t.integer  "quotation_id"
    t.integer  "purchase_type",    default: 0
    t.integer  "contract_id"
    t.string   "description"
    t.text     "observation"
    t.string   "invoice_number"
    t.string   "invoice_file"
    t.integer  "status",           default: 0
    t.integer  "supplier_id"
    t.integer  "order_id"
    t.integer  "delivery",         default: 0
    t.integer  "form_payment",     default: 0
    t.string   "deadline_payment"
    t.integer  "buy_type",         default: 0
    t.string   "seller"
    t.string   "requester"
    t.integer  "carrier_id"
    t.integer  "freight",          default: 0
    t.datetime "created_at",                       null: false
    t.datetime "updated_at",                       null: false
    t.boolean  "inventory_flag",   default: false
    t.string   "icms"
  end

  add_index "deal_purchases", ["carrier_id"], name: "index_deal_purchases_on_carrier_id"
  add_index "deal_purchases", ["contract_id"], name: "index_deal_purchases_on_contract_id"
  add_index "deal_purchases", ["order_id"], name: "index_deal_purchases_on_order_id"
  add_index "deal_purchases", ["quotation_id"], name: "index_deal_purchases_on_quotation_id"
  add_index "deal_purchases", ["supplier_id"], name: "index_deal_purchases_on_supplier_id"

  create_table "deal_quotations", force: :cascade do |t|
    t.string   "description"
    t.integer  "contract_id"
    t.integer  "status",      default: 0
    t.integer  "order_id"
    t.datetime "created_at",              null: false
    t.datetime "updated_at",              null: false
  end

  add_index "deal_quotations", ["contract_id"], name: "index_deal_quotations_on_contract_id"
  add_index "deal_quotations", ["order_id"], name: "index_deal_quotations_on_order_id"

  create_table "deal_supplier_categories", force: :cascade do |t|
    t.string   "title"
    t.boolean  "status",     default: false
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  create_table "deal_suppliers", force: :cascade do |t|
    t.string   "name"
    t.string   "address"
    t.string   "address_complement"
    t.string   "cep"
    t.integer  "city_id"
    t.integer  "state_id"
    t.string   "cnpj"
    t.string   "contact_name"
    t.string   "contact_email"
    t.string   "contact_telephone"
    t.string   "contact_telephone_optional"
    t.string   "contact_celphone"
    t.string   "contact_celphone_optional"
    t.string   "observation"
    t.integer  "supplier_category_id"
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "deal_suppliers", ["city_id"], name: "index_deal_suppliers_on_city_id"
  add_index "deal_suppliers", ["state_id"], name: "index_deal_suppliers_on_state_id"
  add_index "deal_suppliers", ["supplier_category_id"], name: "index_deal_suppliers_on_supplier_category_id"

  create_table "finance_bill_categories", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_billets", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_cost_centers", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_notes", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "finance_payables", force: :cascade do |t|
    t.integer  "contract_id"
    t.integer  "bill_category_id"
    t.integer  "cost_center_id"
    t.datetime "created_at",       null: false
    t.datetime "updated_at",       null: false
  end

  add_index "finance_payables", ["bill_category_id"], name: "index_finance_payables_on_bill_category_id"
  add_index "finance_payables", ["contract_id"], name: "index_finance_payables_on_contract_id"
  add_index "finance_payables", ["cost_center_id"], name: "index_finance_payables_on_cost_center_id"

  create_table "finance_receivables", force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "information_cities", force: :cascade do |t|
    t.string   "name"
    t.boolean  "capital"
    t.integer  "state_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  add_index "information_cities", ["state_id"], name: "index_information_cities_on_state_id"

  create_table "information_states", force: :cascade do |t|
    t.string   "name"
    t.string   "acronym"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "privileges", force: :cascade do |t|
    t.string   "name"
    t.integer  "code"
    t.string   "system_code"
    t.string   "system_name"
    t.boolean  "status",      default: true
    t.datetime "created_at",                 null: false
    t.datetime "updated_at",                 null: false
  end

  add_index "privileges", ["code"], name: "index_privileges_on_code", unique: true

  create_table "users", force: :cascade do |t|
    t.string   "email",                  default: "", null: false
    t.string   "encrypted_password",     default: "", null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,  null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.string   "name"
    t.string   "avatar"
    t.integer  "user_type",              default: 0
    t.boolean  "status"
    t.datetime "created_at",                          null: false
    t.datetime "updated_at",                          null: false
    t.integer  "privilege_id"
  end

  add_index "users", ["email"], name: "index_users_on_email", unique: true
  add_index "users", ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true

end
