class CreateNextActions < ActiveRecord::Migration
  def change
    create_table :next_actions do |t|
      t.string :action
      t.string :by_whom
      t.date :schedule
      t.integer :applicant_id

      t.timestamps
    end
  end
end
