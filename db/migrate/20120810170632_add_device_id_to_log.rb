class AddDeviceIdToLog < ActiveRecord::Migration
  def self.up
     add_column :logs, :notifier_id, :integer
   end

   def self.down
     remove_column :logs, :notifier_id
   end
end
