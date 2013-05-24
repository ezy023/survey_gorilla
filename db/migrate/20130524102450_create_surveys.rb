class CreateSurveys < ActiveRecord::Migration
  def change
    create_table :surveys do |t|
      t.string      :title
      t.text        :description
      t.integer     :creator_id
      t.string      :image 
    end
  end
end
