# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
User.create(username: "question", nickname: "質問者", password: "question")
User.create(username: "answer", nickname: "回答者", password: "answer")
User.create(username: "posting", nickname: "普通の投稿", password: "posting")
Insect.create(name: "????", description: "これは何ですか？", latitude: 36.202537123453739, longitude: 138.25139481141344, category_id: nil, date: nil, prfc: nil, hour: "早朝", image: "https://firebasestorage.googleapis.com/v0/b/camp-h...", pass: nil, user_id: 1, question: true)
Insect.create(name: "カブト", description: "カブトムシ", latitude: 40.202537123453739, longitude: 150.25139481141344, category_id: nil, date: nil, prfc: nil, hour: "午後", image: "https://firebasestorage.googleapis.com/v0/b/camp-h...", pass: nil, user_id: 3, question: false)
