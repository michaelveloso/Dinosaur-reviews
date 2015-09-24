class UserSeeder
  USERS = [
    {
        email: "name@gmail.com",
        password: "password",
        password_confirmation: "password"
    }, {
        email: "someone@gmail.com",
        password: "password",
        password_confirmation: "password"
    }
  ]
  def self.seed!
    USERS.each do |user|
      User.create!(user)
    end
  end
end
