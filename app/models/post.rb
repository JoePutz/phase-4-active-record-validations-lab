class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250 }
    validates :summary, length: { maximum: 250 }
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }
    validates :is_clickbait_enough

    def is_clickbait_enough
        unless title.present? && title.include?("Won't Believe" || "Secret" || "Top [number]" || "Guess")
            errors.add(:title, 'Your title is not clickbait-y')
        end
    end

end
