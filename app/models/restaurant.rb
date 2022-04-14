class Restaurant < ActiveRecord::Base
    has_many :reviews
    has_many :customers, through: :reviews

    def self.fanciest
        Restaurant.order(:price).last
    end
    def all_reviews
        self.reviews.map do |review|
            review.full_review
        end
    end
end