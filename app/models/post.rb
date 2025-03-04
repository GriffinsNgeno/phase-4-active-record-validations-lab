class Post < ApplicationRecord
    validates :title, presence: true
    validates :content, length: { minimum: 250}
    validates :summary, length: { maximum: 250}
    validates :category, inclusion: { in: %w(Fiction Non-Fiction) }

    #custom validations
    validate :title_not_true_facts
    
    def title_not_true_facts
            if title=="True Facts"
                errors.add(:title, "Sorry, title cannot include True Facts")
            end
    end
end