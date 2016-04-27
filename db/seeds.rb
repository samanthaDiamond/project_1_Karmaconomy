User.destroy_all
# User.create(:name => 'Samantha Diamond', :username => 'Sam_Diamond', :postcode => 2060, :biography => 'GA student')

Deed.destroy_all
# Deed.create(:title => 'Borrow tent', :description => '2 man tent, in good condition', :postcode => 2060, :date => 'any date')

Order.destroy_all
Category.destroy_all

User.create(name: "Samantha Diamond",
             username: "Sam_Diamond",
             postcode: 2000,
             biography: "GA student",
             image: "coming",
             karma: 10,
             email: "samanthadiamond89@gmail.com",
             password: "chicken",
             password_confirmation: "chicken",
             admin: true)

Category.create(title: "Fix it")
Category.create(title: "Borrow it")
Category.create(title: "Have it")
Category.create(title: "Use it")
Category.create(title: "Do it")
