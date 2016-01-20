# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


Category.delete_all
Category.create(name:"Phone")
Category.create(name:"TV")
Category.create(name:"Notebook")

Item.delete_all
Item.create(title:"LG G3 Phone", description:"Description about the lg g3 phone", category_id: Category.find_by(name:'Phone').id)
Item.create(title:"LG G2 Phone", description:"Description about lg g2 phone", category_id: Category.find_by(name:'Phone').id)
Item.create(title:"Samsung Note 5", description:"Description about the Samsung Note 5", category_id: Category.find_by(name:'Phone').id)
Item.create(title:"Samsung LED TV", description:"Description about the Samsun LED TV", category_id: Category.find_by(name:'TV').id)
Item.create(title:"Toshiba Satellite", description:"Description about the Toshiba Satellite", category_id: Category.find_by(name:'Notebook').id)
Item.create(title:"Lenovo 500-15ISK", description:"Description about the Lenovo 500-15ISK", category_id: Category.find_by(name:'Notebook').id)
