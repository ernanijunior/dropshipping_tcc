class CreateServices < ActiveRecord::Migration[5.2]
  def change
    create_table :services do |t|
      t.text :text_ask, null: false
      t.text :text_response, null: false
      t.datetime :date_ask
      t.datetime :date_response
      t.references :type_service, foreign_key: true

      t.timestamps
    end
  end
end
