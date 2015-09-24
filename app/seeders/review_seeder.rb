class ReviewSeeder
  REVIEWS = [
    {
      dinosaur: Dinosaur.first,
      user: User.first,
      rating: 5,
      body: "Giga is the coolest, he's totes my favs"
    }, {
      dinosaur: Dinosaur.first,
      user: User.first,
      rating: 1,
      body: "Giga is the worst, he's totes not my favs"
    }, {
      dinosaur: Dinosaur.last,
      user: User.last,
      rating: 3,
      body: "Giga is really just alright..."
    }
  ]
  def self.seed!
    REVIEWS.each do |review|
      Review.find_or_create_by!(review)
    end
  end
end
