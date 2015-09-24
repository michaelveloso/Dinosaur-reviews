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
    }, {
      name: "Camarasaurus",
      location_found: "American West",
      info_url: "https://en.wikipedia.org/wiki/Camarasaurus",
      user: User.last,
      description: "Weighed 20 tons! Woof!"
    }, {
      name: "Coelophysis",
      location_found: "New Mexico (Ghost Ranch Quarry)",
      info_url: "https://en.wikipedia.org/wiki/Coelophysis",
      user: User.last,
      description: "Itty bitty, teeny weeny... for a dinosaur"
    }, {
      name: "Hypacrosaurus",
      location_found: "North America",
      info_url: "https://en.wikipedia.org/wiki/Hypacrosaurus",
      user: User.last,
      description: "Name means almost highest lizard.  He is also a hypocrite."
    }, {
      name: "Saltasaurus",
      location_found: "Argentina",
      info_url: "https://en.wikipedia.org/wiki/Saltasaurus",
      user: User.last,
      description: "Hes super salty"
    }, {
      name: "Sinosauropterys",
      location_found: "China",
      info_url: "https://en.wikipedia.org/wiki/Sinosauropterys",
      user: User.last,
      description: "Can't say his name three times fast."
    }, {
      name: "Therizinosaurus",
      location_found: "Globe Trotter",
      info_url: "https://en.wikipedia.org/wiki/Therizinosaurus",
      user: User.last,
      description: "Fond of salads."
    }, {
      name: "Liopleurodon",
      location_found: "England/France",
      info_url: "https://en.wikipedia.org/wiki/Liopleurodon",
      user: User.last,
      description: "Fond of swimming."
    }, {
      name: "Ankylosaurus",
      location_found: "Western North America",
      info_url: "https://en.wikipedia.org/wiki/Ankylosaurus",
      user: User.last,
      description: "Ankle biter."
    }
  ]
  def self.seed!
    DINOSAURS.each do |dinosaur|
      Dinosaur.find_or_create_by!(dinosaur)
    end
  end
end
