class CreateEducations < ActiveRecord::Migration
  def change
    create_table :educations do |t|
      t.integer :applicant_id
      t.integer :school_id
      t.string :address
      t.string :school_name
      t.string :years_attended
      t.string :course

      t.timestamps
    end
  end
end
