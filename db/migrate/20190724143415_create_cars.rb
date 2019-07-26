class CreateCars < ActiveRecord::Migration[5.2]
  def change
    create_table :cars do |t|
    	t.string   :model
    	t.string   :color
    	t.string 	 :destination

      t.timestamps
    end
  end
end
