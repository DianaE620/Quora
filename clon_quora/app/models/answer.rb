class Answer < ActiveRecord::Base
  # Remember to create a migration!
  validates :answer, length: { minimum: 2 }
  belongs_to :user
  has_many :votes, class_name: "AnswerVote"

  def total_votes
    votes.sum(:votes)
  end

end
