class CreateApplicants < ActiveRecord::Migration
  def change
    create_table :applicants do |t|
      t.integer :source_id
      t.string :other_source
      t.string :first_name
      t.string :middle_name
      t.string :last_name
      t.string :gender
      t.string :civil_status
      t.string :street
      t.string :city
      t.string :region
      t.integer :zip
      t.date :birthdate
      t.string :landline
      t.string :mobile
      t.string :email
      t.string :sss
      t.string :philhealth
      t.string :pagibig
      t.string :tin
      t.text :other_skills
      t.boolean :abroad_plans, :null => false, :default => false
      t.string :how_soon
      t.string :emergency_contact
      t.string :emergency_phone
      t.string :emergency_address
      t.date :date_available_for_work
      t.string :desired_salary_range
      t.date :date_of_application
      t.text :other_observations

      t.timestamps
    end
    
    add_index :applicants, :email
    add_index :applicants, :sss
    add_index :applicants, :philhealth
    add_index :applicants, :pagibig
    add_index :applicants, :tin
  end
end
