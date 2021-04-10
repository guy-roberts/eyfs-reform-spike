unless User.exists?(email: "dom@home.com")
  User.create! do |u|
    u.email = "dom@home.com"
    u.password = "domdom"
  end
end
