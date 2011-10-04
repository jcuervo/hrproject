class CreatePendingApplications < ActiveRecord::Migration
  def change
    create_table :pending_applications do |t|
      t.integer :applicant_id
      t.string :name
      t.string :salary
      t.text :other_info

      t.timestamps
    end
  end
end
