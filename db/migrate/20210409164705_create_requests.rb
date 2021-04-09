class CreateRequests < ActiveRecord::Migration[6.1]
  def change
    create_table :requests do |t|
      t.string :address
      t.datetime :opened_date
      t.datetime :closed_date
      t.bigint :user_closed_id
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
