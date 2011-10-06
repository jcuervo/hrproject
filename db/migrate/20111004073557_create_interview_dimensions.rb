class CreateInterviewDimensions < ActiveRecord::Migration
  def change
    create_table :interview_dimensions do |t|
      t.string :name

      t.timestamps
    end
  end
end
