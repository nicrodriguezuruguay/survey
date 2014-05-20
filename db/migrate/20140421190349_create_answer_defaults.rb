class CreateAnswerDefaults < ActiveRecord::Migration
  def change
    create_table :answer_defaults do |t|
      t.integer :question_id
      t.text :answer

      t.timestamps
    end
  end
end
