class CreateQuestions < ActiveRecord::Migration
  def change
    create_table :questions do |t|
      t.text :contents

      t.timestamps
    end
  end
end
