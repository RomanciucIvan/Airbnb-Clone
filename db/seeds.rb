# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

# Создаем пользователя
Booking.destroy_all
Review.destroy_all
Apartment.destroy_all
User.destroy_all
user = User.create!(email: "vanea02991@mail.ru", password: "vanea0291")


# Создаем квартиру и ассоциируем с пользователем
apartment = user.apartments.create!(
  title: 'Bella Donna Hotel',
  address: 'Bucuresti Str.9, MD 2001 Кишинёв, Молдова',
  description: 'Этот 3-звездочный отель находится в 10 минутах ходьбы от Национального музея истории Молдовы. К услугам гостей номера с кондиционером, спутниковым телевидением и бесплатным WiFi.',
  price: 75,
)
apartment = user.apartments.create!(
  title: 'TRYP by Wyndham Dubai',
  address: 'Al Saef 1 Street Barsha Heights, Теком, Дубай, ОАЭ ',
  description: 'Стильный отель TRYP by Wyndham Dubai расположен в районе Барша-Хайтс, в 600 метрах от станции метро Dubai Internet City',
  price: 35,
)
apartment = user.apartments.create!(
  title: 'Pyramids Gem Plaza Hotel & Suites',
  address: '4 Rawadat El Ahram Street, Al Remaya Square, Гиза, 19999 Каир, Египет',
  description: 'Situated in Cairo, 1.2 km from Giza Pyramids and Great Sphinx, Pyramids Gem Plaza Hotel & Suites features accommodation with free WiFi, air conditioning, a shared lounge and a terrace.',
  price: 95,
)
apartment = user.apartments.create!(
  title: 'Desert Moon',
  address: 'Hadaik Al Ahram 201 W, Гиза, 12611 Каир, Египет',
  description: 'В Desert Moon во всех номерах есть платяной шкаф. В номерах в Desert Moon есть кондиционер, а среди прочих удобств — собственная ванная комната. В ряде номеров имеется гостиная зона. Гостям Desert Moon предоставляются постельное белье и полотенца.',
  price: 305,
)
apartment = user.apartments.create!(
  title: 'PYRAMIDS TOWER Inn',
  address: 'Zaghloul street , giza governorate,egypt, Гиза, 44155 Каир, Египет –2',
  description: 'PYRAMIDS TOWER Inn — это отель, расположенный в городе Каир. К услугам гостей сад, общий лаундж, терраса и ресторан',
  price: 235,
)
apartment = user.apartments.create!(
  title: 'Arabella Residence',
  address: '201 Gamal Abdel Nasser, 5th settlement, Новый Каир, 11835 Каир, Египет –',
  description: 'Set 10 minutes from Cairo Festival City Mall, 250 meter from Grocery, this Aparthotel and Suites offers free WiFi. The property is located 1.3 km from German University in Cairo, 9 km from American University in Cairo.',
  price: 135,
)
apartment = user.apartments.create!(
  title: 'Amin Hotel',
  address: 'Falaky Square 38, 11311 Каир, Египет',
  description: 'В каждом номере отеля Amin есть кондиционер, шкаф для одежды и собственная ванная комната. В числе удобств — телевизор с плоским экраном. Из некоторых номеров открывается вид на город.',
  price: 835,
)
apartment = user.apartments.create!(
  title: 'Hostgram Hotel',
  address: '2 Marouf First floor., 11552 Каир, Египет –',
  description: 'Hostgram Hotel — это отель в городе Каир, в менее чем 1 км от такой достопримечательности, как Площадь Тахрир.',
  price: 435,
)
apartment = user.apartments.create!(
  title: 'Pyramids Sun Capital',
  address: '9 Abo El Hol El Syahy st. in front of the sound and light, Гиза, 12557 Каир, Египет –',
  description: 'Pyramids Sun Capital — это отель в городе Каир, в 600 м от такой достопримечательности, как Большой сфинкс. ',
  price: 375,
)
apartment = user.apartments.create!(
  title: 'Sphinx palace pyramids view',
  address: 'Abou Al Hool Al Seiahi, Гиза, 12557 Каир, Египет –',
  description: 'Sphinx palace pyramids view — это отель, расположенный в городе Каир. К услугам гостей бесплатные велосипеды, общий лаундж, терраса и ресторан.',
  price: 325,
)

require "open-uri"

file = URI.open("https://upload.wikimedia.org/wikipedia/commons/thumb/8/82/NES-Console-Set.jpg/1200px-NES-Console-Set.jpg")
apartment = Apartment.new(title: "NES", description: "A great console", user: user) 
apartment.photos.attach(io: file, filename: "nes.png", content_type: "image/png")
apartment.save
puts "All apartmens was created"