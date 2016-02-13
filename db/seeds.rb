# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Fundraiser.create([
                  {title: 'Demo 1', description: "Gratitude, Love, Compassion.", goal: 50000, equity_given_away: 10, featured: true},
                  {title: 'Demo 2', description: 'Bacon ipsum dolor amet pancetta frankfurter jerky swine bresaola. Sirloin cow alcatra.', goal: 50000, equity_given_away: 10, featured: true},  
                  {title: 'Demo Company', description: 'Bacon ipsum dolor amet pancetta frankfurter jerky swine bresaola. Sirloin cow alcatra, biltong short loin pastrami tail chuck picanha.', goal: 50000, equity_given_away: 10, featured: true}
                  ])
