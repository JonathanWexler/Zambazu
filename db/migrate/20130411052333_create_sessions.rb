class CreateSessions < ActiveRecord::Migration
  def change
    create_table :sessions do |t|
      t.int :correct
      t.int :incorrect

      t.timestamps
    end
  end
end
