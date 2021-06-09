# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

chanel = Designer.create(name: "Chanel")
hermes = Designer.create(name: "Hermes")

men = Taxonomy.create(name: "Men") #1
women = Taxonomy.create(name: "Women") #2
kids = Taxonomy.create(name: "Kids") #3
art = Taxonomy.create(name: "Art") #4
jewelry = Taxonomy.create(name: "Jewelry") #5

chanel.all_taxonomy_ids = [men.id, women.id, kids.id, art.id, jewelry.id] # will return [1,2,3,4,5]
hermes.all_taxonomy_ids = [women.id, kids.id, art.id, jewelry.id] # will return [2,3,4,5]

chanel.accepted_taxonomy_ids = [men.id, women.id, kids.id, art.id, jewelry.id] # will return [1,2,3,4,5]
hermes.accepted_taxonomy_ids = [women.id, kids.id] # will return [2,3]

chanel.exception_taxonomy_ids = []  # will return []
hermes.exception_taxonomy_ids = [art.id, jewelry.id] # will return [4,5]

chanel_shoe = Item.create(name: "Chanel women shoe", designer: chanel, taxonomy: women)
hermes_scarf = Item.create(name: "Hermes scarf", designer: hermes, taxonomy: men)
