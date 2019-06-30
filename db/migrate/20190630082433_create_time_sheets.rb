class CreateTimeSheets < ActiveRecord::Migration[5.2]
  def change
    create_table :time_sheets do |t|
      t.string :project_time
      t.text :description
      t.references :project, foreign_key: true

      t.timestamps
    end
  end
end
