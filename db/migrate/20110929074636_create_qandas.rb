class CreateQandas < ActiveRecord::Migration
  def change
    create_table :qandas do |t|
      t.integer :applicant_id
      t.integer :question_id
      t.boolean :answer
      t.string :others

      t.timestamps
    end
    
    add_index :qandas, :applicant_id
    add_index :qandas, :question_id
  end
end
