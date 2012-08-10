class CreateLogs < ActiveRecord::Migration
  def change
    create_table :logs do |t|
      t.string :to
      t.string :from
      t.string :from_country
      t.string :from_city
      t.string :from_state
      t.text :message
      t.string :notify_result

      t.timestamps
    end
  end
end
