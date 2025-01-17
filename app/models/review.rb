class Review < ActiveRecord::Base
    belongs_to :customer
    belongs_to :restaurant

    def full_review
        "Review for #{self.restaurant.name} by #{self.customer.first_name} #{self.customer.last_name}: #{self.star_rating} stars."
    end
    
end