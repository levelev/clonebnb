# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

require 'faker'
require 'nokogiri'
require 'open-uri'

10.times do
  u = User.create!(
    name: Faker::Name.name,
    email: Faker::Internet.email,
    password: Faker::Crypto.md5

    )
end

# Store URLs in variables

@babysitter = Nokogiri::HTML(open('https://www.ebay-kleinanzeigen.de/s-babysitter-kinderbetreuung/berlin/anzeige:angebote/c290l3331'))
@repairs = Nokogiri::HTML(open('https://www.ebay-kleinanzeigen.de/s-haus-garten/reparaturen/berlin/anzeige:angebote/c291l3331+dienstleistungen_haus_garten.art_s:reparaturen'))
@cleaning = Nokogiri::HTML(open('https://www.ebay-kleinanzeigen.de/s-haus-garten/reingungsservice/berlin/anzeige:angebote/c291l3331+dienstleistungen_haus_garten.art_s:reingungsservice'))

# Define enummeraters for parsing per category

@identifier_babysitter = 1
@identifier_repairs = 1
@identifier_cleaning = 1

# Parsing per category and storage in string

# Babysitter

10.times do
  @identifier_babysitter = 1 if @identifier_babysitter == 10
  r = Listing.create!(
    title: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[2]/h2").text.strip,
    price: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[3]/strong").text.strip,
    description: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[2]/p[1]/text()").text.strip,
    zip: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[3]/text()[1]").text.strip.to_i,
    city: "Berlin",

    category: "Child Care",
    user_id: rand(1..10),
    remote_photo_url: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[1]/div").attr("data-imgsrc").try(:value).try(:gsub, "9.JPG", "72.JPG"),

    )
  @identifier_babysitter += 1
end

# Repairs

10.times do
  @identifier_repairs = 1 if @identifier_repairs == 10
  r = Listing.create!(
    title: @repairs.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_repairs + 1}]/article/section[2]/h2").text.strip,
    price: @repairs.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_repairs + 1}]/article/section[3]/strong").text.strip,
    description: @repairs.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_repairs + 1}]/article/section[2]/p[1]/text()").text.strip,
    zip: @repairs.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_repairs + 1}]/article/section[3]/text()[1]").text.strip.to_i,
    city: "Berlin",

    category: "Repairs",
    user_id: rand(1..10),
    remote_photo_url: @repairs.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_repairs + 1}]/article/section[1]/div").attr("data-imgsrc").try(:value).try(:gsub, "9.JPG", "72.JPG"),

    )
  @identifier_repairs += 1
end

# Cleaning

10.times do
  @identifier_cleaning = 1 if @identifier_cleaning == 10
  r = Listing.create!(
    title: @cleaning.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_cleaning + 1}]/article/section[2]/h2").text.strip,
    price: @cleaning.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_cleaning + 1}]/article/section[3]/strong").text.strip,
    description: @cleaning.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_cleaning + 1}]/article/section[2]/p[1]/text()").text.strip,
    zip: @cleaning.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_cleaning + 1}]/article/section[3]/text()[1]").text.strip.to_i,
    city: "Berlin",

    category: "Cleaning",
    user_id: rand(1..10),
    remote_photo_url: @cleaning.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_cleaning + 1}]/article/section[1]/div").attr("data-imgsrc").try(:value).try(:gsub, "9.JPG", "72.JPG"),

    )
  @identifier_cleaning += 1
end
