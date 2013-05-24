class CreateChoices < ActiveRecord::Migration
  def change
    create_table :choices do |c|
      c.references :question
      c.string     :content
      c.timestamps
    end
  end
end
