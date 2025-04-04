class CreateOrders < ActiveRecord::Migration[7.1]
  def change
    create_table :orders do |t|
      t.datetime :date
      t.references :user, null: false, foreign_key: true
      t.string :status

      t.timestamps
    end
  end
end
