class Choice < ActiveRecord::Base
  belongs_to :questions
  has_many   :responses
  has_many   :users, :through => :responses
end
