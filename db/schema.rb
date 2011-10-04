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
# It's strongly recommended to check this file into your version control system.

ActiveRecord::Schema.define(:version => 20110929074637) do

  create_table "active_admin_comments", :force => true do |t|
    t.integer  "resource_id",   :null => false
    t.string   "resource_type", :null => false
    t.integer  "author_id"
    t.string   "author_type"
    t.text     "body"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string   "namespace"
  end

  add_index "active_admin_comments", ["author_type", "author_id"], :name => "index_active_admin_comments_on_author_type_and_author_id"
  add_index "active_admin_comments", ["namespace"], :name => "index_active_admin_comments_on_namespace"
  add_index "active_admin_comments", ["resource_type", "resource_id"], :name => "index_admin_notes_on_resource_type_and_resource_id"

  create_table "admin_users", :force => true do |t|
    t.string   "email",                                 :default => "", :null => false
    t.string   "encrypted_password",     :limit => 128, :default => "", :null => false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",                         :default => 0
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "admin_users", ["email"], :name => "index_admin_users_on_email", :unique => true
  add_index "admin_users", ["reset_password_token"], :name => "index_admin_users_on_reset_password_token", :unique => true

  create_table "applicants", :force => true do |t|
    t.integer  "source_id"
    t.string   "other_source"
    t.string   "first_name"
    t.string   "middle_name"
    t.string   "last_name"
    t.string   "gender"
    t.string   "civil_status"
    t.string   "street"
    t.string   "city"
    t.string   "region"
    t.integer  "zip"
    t.date     "birthdate"
    t.string   "landline"
    t.string   "mobile"
    t.string   "email"
    t.string   "sss"
    t.string   "philhealth"
    t.string   "pagibig"
    t.string   "tin"
    t.text     "other_skills"
    t.boolean  "abroad_plans",            :default => false, :null => false
    t.string   "how_soon"
    t.string   "emergency_contact"
    t.string   "emergency_phone"
    t.string   "emergency_address"
    t.date     "date_available_for_work"
    t.string   "desired_salary_range"
    t.date     "date_of_application"
    t.text     "other_observations"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "applicants", ["email"], :name => "index_applicants_on_email"
  add_index "applicants", ["pagibig"], :name => "index_applicants_on_pagibig"
  add_index "applicants", ["philhealth"], :name => "index_applicants_on_philhealth"
  add_index "applicants", ["sss"], :name => "index_applicants_on_sss"
  add_index "applicants", ["tin"], :name => "index_applicants_on_tin"

  create_table "availabilities", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "answer"
    t.string   "others"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "ckeditor_assets", :force => true do |t|
    t.string   "data_file_name",                  :null => false
    t.string   "data_content_type"
    t.integer  "data_file_size"
    t.integer  "assetable_id"
    t.string   "assetable_type",    :limit => 30
    t.string   "type",              :limit => 30
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "ckeditor_assets", ["assetable_type", "assetable_id"], :name => "idx_ckeditor_assetable"
  add_index "ckeditor_assets", ["assetable_type", "type", "assetable_id"], :name => "idx_ckeditor_assetable_type"

  create_table "educations", :force => true do |t|
    t.integer  "applicant_id"
    t.integer  "school_id"
    t.string   "address"
    t.string   "school_name"
    t.string   "years_attended"
    t.string   "course"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "families", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "relationship"
    t.string   "name"
    t.integer  "age"
    t.string   "occupation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "page_managements", :force => true do |t|
    t.string   "site"
    t.string   "title"
    t.boolean  "reverse",     :default => true, :null => false
    t.string   "description"
    t.string   "keywords"
    t.string   "permalink"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "pending_applications", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.string   "salary"
    t.text     "other_info"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "qandas", :force => true do |t|
    t.integer  "applicant_id"
    t.integer  "question_id"
    t.boolean  "answer"
    t.string   "others"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  add_index "qandas", ["applicant_id"], :name => "index_qandas_on_applicant_id"
  add_index "qandas", ["question_id"], :name => "index_qandas_on_question_id"

  create_table "questions", :force => true do |t|
    t.string   "question"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "references", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "name"
    t.string   "address"
    t.string   "contact"
    t.string   "occupation"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "schools", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "sources", :force => true do |t|
    t.string   "name"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

  create_table "work_experiences", :force => true do |t|
    t.integer  "applicant_id"
    t.string   "employer"
    t.string   "address"
    t.string   "supervisor"
    t.string   "supervisor_contact"
    t.boolean  "can_contact",        :default => false, :null => false
    t.string   "job_title"
    t.date     "employed_from"
    t.date     "employed_to"
    t.string   "salary_range"
    t.text     "responsibilities"
    t.text     "reason_for_leaving"
    t.datetime "created_at"
    t.datetime "updated_at"
  end

end
