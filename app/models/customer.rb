class Customer < ActiveRecord::Base
    has_many :reviews
    has_many :restaurants, through: :reviews

    def full_name
        "#{first_name} #{last_name}"
    end
    def favorite_restaurant
        self.reviews.order(:star_rating).last.restaurant
    end
    def add_review(restaurant, star_rating)
        Review.create(restaurant: restaurant, star_rating: star_rating, customer_id: self.id, restaurant_id: restaurant.id)        
    end
    def delete_reviews(restaurant)
        self.reviews.where(restaurant: restaurant).destroy_all
    end
end
