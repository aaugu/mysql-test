[1mdiff --git a/app/models/article.rb b/app/models/article.rb[m
[1mindex 0a309aa..3698531 100644[m
[1m--- a/app/models/article.rb[m
[1m+++ b/app/models/article.rb[m
[36m@@ -1,4 +1,3 @@[m
 class Article < ApplicationRecord[m
[31m-  validates :title, :content, :url, presence: true[m
[31m-  validates :url, format: {with: /\Ahttps:\/\/[a-z0-9]+([-.]{1}[a-z0-9]+)*\.[a-z]{2,5}(([0-9]{1,5})?\/.*)?\z/}[m
[32m+[m[32m  belongs_to :user[m
 end[m
[1mdiff --git a/app/models/user.rb b/app/models/user.rb[m
[1mindex 4756799..9519113 100644[m
[1m--- a/app/models/user.rb[m
[1m+++ b/app/models/user.rb[m
[36m@@ -1,4 +1,5 @@[m
 class User < ApplicationRecord[m
[32m+[m[32m  has_many :articles, dependent: :destroy[m
   # Include default devise modules. Others available are:[m
   # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable[m
   devise :database_authenticatable, :registerable,[m
[1mdiff --git a/db/migrate/20220822082750_create_articles.rb b/db/migrate/20220822082750_create_articles.rb[m
[1mdeleted file mode 100644[m
[1mindex de7f406..0000000[m
[1m--- a/db/migrate/20220822082750_create_articles.rb[m
[1m+++ /dev/null[m
[36m@@ -1,11 +0,0 @@[m
[31m-class CreateArticles < ActiveRecord::Migration[7.0][m
[31m-  def change[m
[31m-    create_table :articles do |t|[m
[31m-      t.string :title[m
[31m-      t.text :content[m
[31m-      t.string :url[m
[31m-[m
[31m-      t.timestamps[m
[31m-    end[m
[31m-  end[m
[31m-end[m
[1mdiff --git a/db/schema.rb b/db/schema.rb[m
[1mindex ed064a8..0ac6e1d 100644[m
[1m--- a/db/schema.rb[m
[1m+++ b/db/schema.rb[m
[36m@@ -10,13 +10,15 @@[m
 #[m
 # It's strongly recommended that you check this file into your version control system.[m
 [m
[31m-ActiveRecord::Schema[7.0].define(version: 2022_08_22_115905) do[m
[32m+[m[32mActiveRecord::Schema[7.0].define(version: 2022_08_22_123343) do[m
   create_table "articles", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|[m
     t.string "title"[m
     t.text "content"[m
     t.string "url"[m
[32m+[m[32m    t.bigint "user_id", null: false[m
     t.datetime "created_at", null: false[m
     t.datetime "updated_at", null: false[m
[32m+[m[32m    t.index ["user_id"], name: "index_articles_on_user_id"[m
   end[m
 [m
   create_table "users", charset: "utf8mb4", collation: "utf8mb4_0900_ai_ci", force: :cascade do |t|[m
[36m@@ -31,4 +33,5 @@[m [mActiveRecord::Schema[7.0].define(version: 2022_08_22_115905) do[m
     t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true[m
   end[m
 [m
[32m+[m[32m  add_foreign_key "articles", "users"[m
 end[m
[1mdiff --git a/db/seeds.rb b/db/seeds.rb[m
[1mindex 051dc6d..780167e 100644[m
[1m--- a/db/seeds.rb[m
[1m+++ b/db/seeds.rb[m
[36m@@ -7,10 +7,15 @@[m
 #   Character.create(name: "Luke", movie: movies.first)[m
 puts "Cleaning database..."[m
 Article.destroy_all[m
[32m+[m[32mUser.destroy_all[m
 [m
 puts "Creating articles..."[m
[31m-article_1 = {title: "LES MEILLEURES CRÊPES IG BAS SUR TERRE – LÉGÈRES, MOELLEUSES & FINES", content: "Un titre très humble, n’est-ce pas ? En même temps, je suis l’héritière de la reine des crêpes (ma mère) et donc mis la barre très haute. Très légères, moelleuses et fines, c’est comme ça que je les aime. Je ne les aime pas épaisses, ni croustillantes, ni cartonneuses. Et je vais vous donner mes astuces pour les réussir car il ne suffit pas d’une simple recette énoncée.", url: "https://megalowfood.com/les-meilleures-crepes-ig-bas-sur-terre-legeres-moelleuses-fines/"}[m
[31m-article_2 =  {title: "TARTE SALÉE DU PETIT DÉJEUNER ALIAS « BREAKFAST GALETTE » – IG BAS", content: "Tous les éléments gourmands du matin réunis dans cette petite tarte nutritive et express : des oeufs, des champignons, du fromage et du bacon. La pâte à tarte facile à réaliser constitue un apport en glucides complexes.", url: "https://megalowfood.com/tarte-salee-du-petit-dejeuner-alias-breakfast-galette-ig-bas/"}[m
[32m+[m[32madmin = User.create(email: "admin@email.ch", password: "123456")[m
[32m+[m[32mputs "Created #{admin.email}"[m
[32m+[m
[32m+[m[32mputs "Creating articles..."[m
[32m+[m[32marticle_1 = {title: "LES MEILLEURES CRÊPES IG BAS SUR TERRE – LÉGÈRES, MOELLEUSES & FINES", content: "Un titre très humble, n’est-ce pas ? En même temps, je suis l’héritière de la reine des crêpes (ma mère) et donc mis la barre très haute. Très légères, moelleuses et fines, c’est comme ça que je les aime. Je ne les aime pas épaisses, ni croustillantes, ni cartonneuses. Et je vais vous donner mes astuces pour les réussir car il ne suffit pas d’une simple recette énoncée.", url: "https://megalowfood.com/les-meilleures-crepes-ig-bas-sur-terre-legeres-moelleuses-fines/", user: admin}[m
[32m+[m[32marticle_2 =  {title: "TARTE SALÉE DU PETIT DÉJEUNER ALIAS « BREAKFAST GALETTE » – IG BAS", content: "Tous les éléments gourmands du matin réunis dans cette petite tarte nutritive et express : des oeufs, des champignons, du fromage et du bacon. La pâte à tarte facile à réaliser constitue un apport en glucides complexes.", url: "https://megalowfood.com/tarte-salee-du-petit-dejeuner-alias-breakfast-galette-ig-bas/", user: admin}[m
 [m
 [article_1, article_2].each do |attributes|[m
   article = Article.create!(attributes)[m
[1mdiff --git a/test/fixtures/articles.yml b/test/fixtures/articles.yml[m
[1mindex 432493e..fd8d0d1 100644[m
[1m--- a/test/fixtures/articles.yml[m
[1m+++ b/test/fixtures/articles.yml[m
[36m@@ -4,8 +4,10 @@[m [mone:[m
   title: MyString[m
   content: MyText[m
   url: MyString[m
[32m+[m[32m  user: one[m
 [m
 two:[m
   title: MyString[m
   content: MyText[m
   url: MyString[m
[32m+[m[32m  user: two[m
