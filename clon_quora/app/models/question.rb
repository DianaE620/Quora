class Question < ActiveRecord::Base
  # Remember to create a migration!
  has_many :answers
  has_many :votes, class_name: "QuestionVote"
  validates :question, length: { minimum: 2 }

  def total_votes
    votes.sum(:votes)
  end

end
