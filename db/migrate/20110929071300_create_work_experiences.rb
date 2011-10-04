class CreateWorkExperiences < ActiveRecord::Migration
  def change
    create_table :work_experiences do |t|
      t.integer :applicant_id
      t.string :employer
      t.string :address
      t.string :supervisor
      t.string :supervisor_contact
      t.boolean :can_contact, :null => false, :default => false
      t.string :job_title
      t.date :employed_from
      t.date :employed_to
      t.string :salary_range
      t.text :responsibilities
      t.text :reason_for_leaving

      t.timestamps
    end
  end
end
