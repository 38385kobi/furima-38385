class CreateCategoris < ActiveRecord::Migration[6.0]
  def change
    create_table :categoris do |t|

      t.timestamps
    end
  end
end
