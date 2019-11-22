# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

artists = ['picasso', 'monet', 'manet', 'dali']

artists.each do |artist|
  User.create(username: artist)
end 

artworks = [
  ['title', 'image_url', 5], 
  ['title2', 'www.art.com', 5],
  ['starry night', 'google', 7], 
  ['???', 'www.???.com', 8], 
  ['american gothic', 'america', 4],
  ['water lilies', '545', 9],
  ['guernica', 'qwerty', 6],
  ['the scream', 'jlk;', 6]
]

artworks.each do |artwork|
  Artwork.create(title: artwork[0], image_url: artwork[1], artist_id: artwork[2])
end 