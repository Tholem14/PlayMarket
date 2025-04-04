class CreateTransactions < ActiveRecord::Migration[7.1]
  def change
    create_table :transactions do |t|
      t.references :user, null: false, foreign_key: true
      t.references :order, null: false, foreign_key: true
      t.decimal :amount, precision: 10, scale: 2
      t.string :status, default: "pending"

      t.timestamps
    end
  end
end
