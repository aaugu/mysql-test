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
article_1 = {title: "
La question du recours aux approches complémentaires par les personnes souffrant de cancer", content: "La question du recours aux approches complémentaires par les personnes souffrant de cancer » Mémoire de Master en Psychologie de la Santé, Université de Lausanne Faculté des SSP, Institut de psychologie. Résumé Les approches complémentaires (AC) sont de plus en plus utilisées par les personnes souffrant de cancer. Face à ce phénomène, la communauté scientifique se penche depuis quelques années maintenant sur cette question en tentant de comprendre ce qui suscite un tel engouement chez les malades", url: "https://sarah-bezencon.ch/la-question-du-recours-aux-approches-complementaires-par-les-personnes-souffrant-de-cancer/"}
article_2 =  {title: "Reiki – Pour qui ?", content: "Pour qui ? Le Reiki s'adresse à tous (enfants, adultes, femmes enceintes, personnes âgées) en permettant à chacun d'aller vers un mieux-être. Il s’agit d’un excellent outil d’accompagnement pour les personnes désirant s’engager dans un travail personnel. D’une manière générale, le Reiki peut être bénéfique dans les situations suivantes : Lors d’anxiété et d’angoisse En cas de déprime ou de dépression En cas de burn-out (prévention, accompagnement) En période de stress (examens, concours...) Lors d’insomnies", url: "https://sarah-bezencon.ch/reiki-pour-qui/"}

[article_1, article_2].each do |attributes|
  article = Article.create!(attributes)
  puts "Created #{article.title}"
end
puts "Finished!"
