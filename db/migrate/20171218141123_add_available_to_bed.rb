class AddAvailableToBed < ActiveRecord::Migration[5.1]
  def change
    add_column :beds, :available, :boolean, :default => 'true'
  end
end
