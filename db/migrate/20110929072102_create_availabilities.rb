class CreateAvailabilities < ActiveRecord::Migration
  def change
    create_table :availabilities do |t|
      t.integer :applicant_id
      t.string :answer
      t.string :others

      t.timestamps
    end
  end
end
