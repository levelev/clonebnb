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
@identifier_repairs = 1

# Parsing per category and storage in string

10.times do
  @identifier_babysitter = 1 if @identifier_babysitter == 10
  r = Listing.create!(
    title: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[2]/h2").text.strip,
    price: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[3]/strong").text.strip,
    description: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[2]/p[1]/text()").text.strip,
    zip: @babysitter.xpath("//*[@id='srchrslt-adtable']/li[#{@identifier_babysitter + 1}]/article/section[3]/text()[1]").text.strip.to_i,
    city: "Berlin",
    category: "Child Care",
    user_id: rand(1..10)
#    photo: nil,
    )
  @identifier_babysitter += 1
end

