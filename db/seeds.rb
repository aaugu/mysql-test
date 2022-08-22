# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)
puts "Cleaning database..."
Article.destroy_all

puts "Creating articles..."
article_1 = {title: "LES MEILLEURES CRÊPES IG BAS SUR TERRE – LÉGÈRES, MOELLEUSES & FINES", content: "Un titre très humble, n’est-ce pas ? En même temps, je suis l’héritière de la reine des crêpes (ma mère) et donc mis la barre très haute. Très légères, moelleuses et fines, c’est comme ça que je les aime. Je ne les aime pas épaisses, ni croustillantes, ni cartonneuses. Et je vais vous donner mes astuces pour les réussir car il ne suffit pas d’une simple recette énoncée.", url: "https://megalowfood.com/les-meilleures-crepes-ig-bas-sur-terre-legeres-moelleuses-fines/"}
article_2 =  {title: "TARTE SALÉE DU PETIT DÉJEUNER ALIAS « BREAKFAST GALETTE » – IG BAS", content: "Tous les éléments gourmands du matin réunis dans cette petite tarte nutritive et express : des oeufs, des champignons, du fromage et du bacon. La pâte à tarte facile à réaliser constitue un apport en glucides complexes.", url: "https://megalowfood.com/tarte-salee-du-petit-dejeuner-alias-breakfast-galette-ig-bas/"}

[article_1, article_2].each do |attributes|
  article = Article.create!(attributes)
  puts "Created #{article.title}"
end
puts "Finished!"
