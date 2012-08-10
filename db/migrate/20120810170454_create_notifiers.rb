class CreateNotifiers < ActiveRecord::Migration
  def change
    create_table :notifiers do |t|
      t.string :twilio_id
      t.string :device_id

      t.timestamps
    end
  end
end
