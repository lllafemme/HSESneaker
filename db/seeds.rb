# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Rake::Task['db:drop'].invoke
Rake::Task['db:create'].invoke
Rake::Task['db:migrate'].invoke

def random_brand_id
  Brand.offset(rand(Brand.count)).first.id
end

def upload_fake_image
  uploader = ImageUploader.new(Sneaker.new, :image)
  uploader.cache!(File.open(Dir.glob(File.join(Rails.root, 'lib/tasks/sneakers', '*')).sample))
  uploader
end

Brand.create([
  {
    name: 'Adidas',
  }, {
    name: 'Nike',
  }, {
    name: 'Asics',
  }, {
    name: 'New Balance',
  }, {
    name: 'Reebok',
  }
])

@sneaker_models = ['M998DTK Light Grey/Black', 'M997CNR Grey/Blue/Red', 'M990GL4 Grey/Castlerock', 'x Dave White x size? Air Max 95 Rabbit Stone/Thunder/Light Bone', 'x Wings + Horns NMD R2 Hint/Hint/Hint', 'x Wings + Horns NMD R2 Ash/Ash/Off White', 'Gel-Lyte III Veg-Tan Pack Tan/Tan', 'Gel-Kayano Trainer Knit Reflective Knit Pack Silver/White', 'x Black Scale Instapump Fury OG Black/White', 'Instapump Fury Pop Black/Vital Blue/White', 'Air Max 95 Ultra Essential Gym Red/White/White', 'Air Max Plus VT Night Maroon/White', 'Air Max LD-Zero Sail/Sail/Black']
@sneaker_sex = ['male', 'female']
def sneaker_price
 rand(12290..24990)
end

def create_sneaker
  Sneaker.create(
    brand_id: random_brand_id,
    model: @sneaker_models.sample,
    sex: @sneaker_sex.sample,
    price: sneaker_price,
    image: upload_fake_image
  )
end

100.times do
  create_sneaker
end
# Sneaker.create([
#   {
#     brand_id: random_brand_id,
#     model: 'M998DTK Light Grey/Black',
#     sex: 'male',
#     price: 24990,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'M997CNR Grey/Blue/Red',
#     sex: 'male',
#     price: 24990,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'M990GL4 Grey/Castlerock',
#     sex: 'male',
#     price: 19990,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'x Dave White x size? Air Max 95 Rabbit Stone/Thunder/Light Bone',
#     sex: 'male',
#     price: 17290,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'x Wings + Horns NMD R2 Hint/Hint/Hint',
#     sex: 'male',
#     price: 14890,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'x Wings + Horns NMD R2 Ash/Ash/Off White',
#     sex: 'male',
#     price: 24990,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Gel-Lyte III Veg-Tan Pack Tan/Tan',
#     sex: 'male',
#     price: 13890,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Gel-Kayano Trainer Knit Reflective Knit Pack Silver/White',
#     sex: 'male',
#     price: 13890,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'x Black Scale Instapump Fury OG Black/White',
#     sex: 'male',
#     price: 12590,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Instapump Fury Pop Black/Vital Blue/White',
#     sex: 'male',
#     price: 12590,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Air Max 95 Ultra Essential Gym Red/White/White',
#     sex: 'male',
#     price: 12390,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Air Max Plus VT Night Maroon/White',
#     sex: 'male',
#     price: 12390,
#     image: upload_fake_image
#   }, {
#     brand_id: random_brand_id,
#     model: 'Air Max LD-Zero Sail/Sail/Black',
#     sex: 'male',
#     price: 12290,
#     image: upload_fake_image
#   }
# ])
