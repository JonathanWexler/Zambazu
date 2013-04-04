class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.string :question
      t.string :first
      t.string :second
      t.string :third
      t.string :fourth

      t.timestamps
    end
  end
end
