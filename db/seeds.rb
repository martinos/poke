# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
#
require "open-uri"
data = URI.open("https://gist.githubusercontent.com/armgilles/194bcff35001e7eb53a2a8b441e8b2c6/raw/92200bc0a673d5ce2110aaad4544ed6c4010f687/pokemon.csv").read

require "csv"
csv = CSV.parse(data)
csv.shift

csv.each do |a|
  Pokemon.create!(name: a[1],
                  type_1: a[2],
                  type_2: a[3],
                  total: a[4],
                  hp: a[5],
                  attack: a[6],
                  defense: a[7],
                  sp_atk: a[8],
                  sp_def: a[9],
                  speed: a[10],
                  generation: a[11],
                  legendary: a[12] == "true")
end
