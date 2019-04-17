class CreateQuestions < ActiveRecord::Migration[5.2]
  def change
    create_table :questions do |t|
      t.text :question
      t.text :response
      t.datetime :date_question
      t.datetime :date_response
      t.references :subject, foreign_key: true

      t.timestamps
    end
  end
end
