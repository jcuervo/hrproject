class CreateFamilies < ActiveRecord::Migration
  def change
    create_table :families do |t|
      t.integer :applicant_id
      t.string :relationship
      t.string :name
      t.integer :age
      t.string :occupation

      t.timestamps
    end
  end
end
