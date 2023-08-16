class CreateAdvanceTrainings < ActiveRecord::Migration[7.0]
  def change
    create_table :advance_trainings do |t|
      t.string :first_name
      t.string :last_name
      t.string :email
      t.string :phone
      t.text :comments
      t.string :certificate_sought

      t.timestamps
    end
  end
end
