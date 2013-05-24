class CreateResponses < ActiveRecord::Migration
  def change
    create_table :responses do |r|
      r.references :choice
      r.references :user
      r.timestamps
    end
  end
end
