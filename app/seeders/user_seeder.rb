class UserSeeder
  USERS = [
    {
      email: "stacy@gmail.com",
      password: "password",
      password_confirmation: "password",
      admin: true
    }, {
      email: "mike@gmail.com",
      password: "password",
      password_confirmation: "password",
      admin: true
    }, {
      email: "michelle@gmail.com",
      password: "password",
      password_confirmation: "password",
      admin: true
    }, {
      email: "maribeth@gmail.com",
      password: "password",
      password_confirmation: "password",
      admin: true
    }
  ]
  def self.seed!
    USERS.each do |user|
      User.create!(user)
    end
  end
end
