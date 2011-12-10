class CreateEmployees < ActiveRecord::Migration
  def change
    create_table :employees do |t|
      t.string :name
      t.string :job_title
      t.date :birthday
      t.decimal :salary

      t.timestamps
    end
  end
end
