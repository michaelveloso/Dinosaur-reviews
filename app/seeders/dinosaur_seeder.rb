class DinosaurSeeder
  DINOSAURS = [
    {
        name: "Giganotosaurus",
        location_found: "South America",
        info_url: "https://en.wikipedia.org/wiki/Giganotosaurus",
        user: User.first,
        description: "This dinosaur is giganotic!"
      }, {
        name: "Spinosaurus",
        location_found: "North Africa",
        info_url: "https://en.wikipedia.org/wiki/Spinosaurus",
        user: User.first,
        description: "This dinosaur is spiny!"
      }, {
        name: "Tyrannosaurus",
        location_found: "Western North America",
        info_url: "https://en.wikipedia.org/wiki/Tyrannosaurus",
        user: User.last,
        description: "This dinosaur has itty bitty arms!"
    }
  ]
  def self.seed!
    DINOSAURS.each do |dinosaur|
      Dinosaur.find_or_create_by!(dinosaur)
    end
  end
end
