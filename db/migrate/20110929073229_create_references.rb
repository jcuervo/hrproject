class CreateReferences < ActiveRecord::Migration
  def change
    create_table :references do |t|
      t.integer :applicant_id
      t.string :name
      t.string :address
      t.string :contact
      t.string :occupation

      t.timestamps
    end
  end
end
