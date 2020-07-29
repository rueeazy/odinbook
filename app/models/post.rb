class Post < ApplicationRecord
    belongs_to :user
    has_many :comments
    has_many :likes, dependent: :destroy

    def posted_feedback
        self.comments.map{ |comment| "#{comment.comment} - #{comment.user.first_name}"}
    end
end
