class Answer < ActiveRecord::Base
  belongs_to :question

  validates :question_id, presence: true
  validates :description, presence: true, length: {minimum: 50}
end
