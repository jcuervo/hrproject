class CreateInterviewRatings < ActiveRecord::Migration
  def change
    create_table :interview_ratings do |t|
      t.integer :interview_dimension_id
      t.integer :applicant_id
      t.string :answer
      t.integer :admin_user_id

      t.timestamps
    end
  end
end
