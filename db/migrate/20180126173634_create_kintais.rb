class CreateKintais < ActiveRecord::Migration
  def change
    create_table :kintais do |t|
      t.integer  :user_id
      t.datetime :started_at
      t.datetime :finished_at

      t.timestamps null: false
    end
  end
end
