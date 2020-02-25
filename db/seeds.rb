require "open-uri"

puts "Destroying the old database"
VisitedPage.destroy_all
RoundParticipation.destroy_all
Round.destroy_all
GameSession.destroy_all
User.destroy_all
puts "All the old database has been deleted"

puts "Creating new users..."
user1 = User.new(email: "aaaaa@aaaaa.fr", password: "123456", first_name: "Alexis", last_name: "Filia", username: "Alex")
picture1 = URI.open('https://images.unsplash.com/photo-1574257434424-2ee5b4fa8922?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=1489&q=80')
user1.photo.attach(io: picture1, filename: 'user1.jpg', content_type: 'image/png')
user1.save!

user2 = User.new(email: "bbbbb@bbbbb.fr", password: "123456", first_name: "Tim", last_name: "Boing", username: "TimTim")
picture2 = URI.open('https://images.unsplash.com/photo-1517423738875-5ce310acd3da?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=705&q=80')
user2.photo.attach(io: picture2, filename: 'user2.png', content_type: 'image/png')
user2.save!

user3 = User.new(email: "ccccc@ccccc.fr", password: "123456", first_name: "Geoffrey", last_name: "Dulac", username: "GeoffreyXXX")
picture3 = URI.open('https://res.cloudinary.com/dwsebrqxl/image/upload/v1582122066/mec1_fazdks.jpg')
user3.photo.attach(io: picture3, filename: 'user3.png', content_type: 'image/png')
user3.save!

user4 = User.new(email: "ddddd@ddddd.fr", password: "123456", first_name: "VanderWees", last_name: "Maxime", username: "Max")
picture4 = URI.open('https://images.unsplash.com/photo-1505628346881-b72b27e84530?ixlib=rb-1.2.1&ixid=eyJhcHBfaWQiOjEyMDd9&auto=format&fit=crop&w=634&q=80')
user4.photo.attach(io: picture4, filename: 'user4.png', content_type: 'image/png')
user4.save!

user5 = User.new(email: "eeeee@eeeee.fr", password: "123456", first_name: "Bobby", last_name: "Lapointe", username: "Bob")
picture5 = URI.open('https://images.unsplash.com/photo-1518020382113-a7e8fc38eac9?ixlib=rb-1.2.1&auto=format&fit=crop&w=660&q=80')
user5.photo.attach(io: picture5, filename: 'user5.png', content_type: 'image/png')
user5.save!
puts "Some users have been created"

puts "Creating new game sessions..."
game_session1 = GameSession.new(user: user1)
game_session2 = GameSession.new(user: user1)
game_session3 = GameSession.new(user: user1)
game_session4 = GameSession.new(user: user1)
game_session5 = GameSession.new(user: user2)
game_session6 = GameSession.new(user: user2)
game_session7 = GameSession.new(user: user2)
game_session8 = GameSession.new(user: user3)
game_session9 = GameSession.new(user: user3)
game_session10 = GameSession.new(user: user4)
game_session11 = GameSession.new(user: user4)
game_session12 = GameSession.new(user: user4)
puts "Some game sessions have been created"

puts "Creating new rounds..."
round1 = Round.new(start_page: "Phare_de_Pumpkin_Island", end_page: "Polycétide_synthase", state: "ended", start_time: Time.now - 260, game_session: game_session1)
round2 = Round.new(start_page: "Liste_des_églises_les_plus_hautes_de_France", end_page: "Slam_Stewart", state: "ended", start_time: Time.now - 160, game_session: game_session1)
round3 = Round.new(start_page: "Erwan_Bergot", end_page: "Sapmer", state: "ended", start_time: Time.now - 60, game_session: game_session1)
round4 = Round.new(start_page: "Siméon_II_(roi_de_Bulgarie)", end_page: "Sphaerodactylus_oxyrhinus", state: "ended", start_time: Time.now - 30, game_session: game_session1)
round5 = Round.new(start_page: "Lalou_Roucayrol", end_page: "Château_de_Longecourt-en-Plaine", state: "initiated", start_time: Time.now, game_session: game_session1)
round6 = Round.new(start_page: "Frédéric_Durand_(écrivain)", end_page: "Échange_territorial_entre_la_Moldavie_et_l'Ukraine", state: "ended", start_time: Time.now - 360, game_session: game_session2)
round7 = Round.new(start_page: "Comité_de_protection_des_personnes", end_page: "Frontières_du_Royaume-Uni", state: "ended", start_time: Time.now - 7660, game_session: game_session2)
round8 = Round.new(start_page: "Forfait_journalier_hospitalier", end_page: "Ortigosa_del_Monte", state: "ended", start_time: Time.now - 6060, game_session: game_session2)
round9 = Round.new(start_page: "LoveHateHero", end_page: "Pamela_H._Smith", state: "playing", start_time: Time.now, game_session: game_session2)
round10 = Round.new(start_page: "Aïkiryu", end_page: "Raphaël_Attie", state: "ended", start_time: Time.now - 12260, game_session: )
round11 = Round.new(start_page: "Route_I/59_(Slovaquie)", end_page: "Alfred_Almont", state: "initiated", start_time: Time.now, game_session: game_session3)
round12 = Round.new(start_page: "Cavergno", end_page: "Kouty_(district_de_Havlíčkův_Brod)", state: "ended", start_time: Time.now - 560, game_session: game_session4)
round13 = Round.new(start_page: "Red_Wings_de_Détroit", end_page: "Liste_des_églises_les_plus_hautes_de_France", state: "ended", start_time: Time.now - 160, game_session: game_session5)
round14 = Round.new(start_page: "Phare_de_Pumpkin_Island", end_page: "Sphaerodactylus_oxyrhinus", state: "ended", start_time: Time.now - 20, game_session: game_session6)
round15 = Round.new(start_page: "Siméon_II_(roi_de_Bulgarie)", end_page: "Sphaerodactylus_oxyrhinus", state: "ended", start_time: Time.now - 10000, game_session: game_session7)
round16 = Round.new(start_page: "Aïkiryu", end_page: "Slam_Stewart", state: "initiated", start_time: Time.now, game_session: game_session8)
round17 = Round.new(start_page: "Phare_de_Pumpkin_Island", end_page: "Polycétide_synthase", state: "ended", start_time: Time.now - 27060, game_session: game_session9)
round18 = Round.new(start_page: "Liste_des_églises_les_plus_hautes_de_France", end_page: "Slam_Stewart", state: "ended", start_time: Time.now - 560, game_session: game_session10)
round19 = Round.new(start_page: "Erwan_Bergot", end_page: "Sapmer", state: "ended", start_time: Time.now - 250060, game_session: game_session11)
round20 = Round.new(start_page: "Siméon_II_(roi_de_Bulgarie)", end_page: "Sphaerodactylus_oxyrhinus", state: "ended", start_time: Time.now - 1100, game_session: game_session11)
round21 = Round.new(start_page: "Lalou_Roucayrol", end_page: "Château_de_Longecourt-en-Plaine", state: "initiated", start_time: Time.now, game_session: game_session11)
round22 = Round.new(start_page: "Frédéric_Durand_(écrivain)", end_page: "Échange_territorial_entre_la_Moldavie_et_l'Ukraine", state: "ended", start_time: Time.now - 70000, game_session: game_session12)
round23 = Round.new(start_page: "Comité_de_protection_des_personnes", end_page: "Frontières_du_Royaume-Uni", state: "ended", start_time: Time.now - 60000, game_session: game_session12)
round24 = Round.new(start_page: "Forfait_journalier_hospitalier", end_page: "Ortigosa_del_Monte", state: "ended", start_time: Time.now - 50000, game_session: game_session12)
round25 = Round.new(start_page: "LoveHateHero", end_page: "Pamela_H._Smith", state: "playing", start_time: Time.now, game_session: game_session12)
puts "Some rounds have been created"

puts "Creating some round participations"
round_participation1 = RoundParticipation.new(user: user1, round: round1, score: 0, rank: 1, end_time: Time.now)
round_participation2 = RoundParticipation.new(user: user1, round: round2, score: 20, rank: 2, end_time: Time.now)
round_participation3 = RoundParticipation.new(user: user1, round: round3, score: 10, rank: 1, end_time: Time.now)
round_participation4 = RoundParticipation.new(user: user1, round: round6, score: 12, rank: 3, end_time: Time.now)
round_participation5 = RoundParticipation.new(user: user1, round: round7, score: 2, rank: 2, end_time: Time.now)
round_participation6 = RoundParticipation.new(user: user2, round: round1, score: 100, rank: 4, end_time: Time.now)
round_participation7 = RoundParticipation.new(user: user2, round: round2, score: 30, rank: 5, end_time: Time.now)
round_participation8 = RoundParticipation.new(user: user2, round: round8, score: 60, rank: 2, end_time: Time.now)
round_participation9 = RoundParticipation.new(user: user2, round: round9, score: 200, rank: 1, end_time: Time.now)
round_participation10 = RoundParticipation.new(user: user2, round: round10, score: 17, rank: 2, end_time: Time.now)
round_participation11 = RoundParticipation.new(user: user2, round: round6, score: 75, rank: 3, end_time: Time.now)
round_participation12 = RoundParticipation.new(user: user3, round: round1, score: 80, rank: 7, end_time: Time.now)
round_participation13 = RoundParticipation.new(user: user3, round: round11, score: 20, rank: 6, end_time: Time.now)
round_participation14 = RoundParticipation.new(user: user4, round: round1, score: 23, rank: 5, end_time: Time.now)
round_participation15 = RoundParticipation.new(user: user4, round: round12, score: 70, rank: 4, end_time: Time.now)
round_participation16 = RoundParticipation.new(user: user5, round: round1, score: 45, rank: 3, end_time: Time.now)
round_participation17 = RoundParticipation.new(user: user5, round: round13, score: 74, rank: 2, end_time: Time.now)
round_participation18 = RoundParticipation.new(user: user5, round: round3, score: 1, rank: 2, end_time: Time.now)
round_participation19 = RoundParticipation.new(user: user1, round: round14, score: 0, rank: 1, end_time: Time.now)
round_participation20 = RoundParticipation.new(user: user1, round: round15, score: 101, rank: 1, end_time: Time.now)
round_participation21 = RoundParticipation.new(user: user2, round: round16, score: 64, rank: 1, end_time: Time.now)
round_participation22 = RoundParticipation.new(user: user2, round: round17, score: 83, rank: 2, end_time: Time.now)
round_participation23 = RoundParticipation.new(user: user3, round: round18, score: 29, rank: 2, end_time: Time.now)
round_participation24 = RoundParticipation.new(user: user3, round: round4, score: 93, rank: 1, end_time: Time.now)
round_participation25 = RoundParticipation.new(user: user4, round: round4, score: 49, rank: 4, end_time: Time.now)
round_participation26 = RoundParticipation.new(user: user4, round: round5, score: 82, rank: 3, end_time: Time.now)
round_participation27 = RoundParticipation.new(user: user5, round: round5, score: 58, rank: 2, end_time: Time.now)
round_participation28 = RoundParticipation.new(user: user5, round: round19, score: 62, rank: 1, end_time: Time.now)
round_participation29 = RoundParticipation.new(user: user1, round: round20, score: 27, rank: 1, end_time: Time.now)
round_participation30 = RoundParticipation.new(user: user1, round: round21, score: 38, rank: 5, end_time: Time.now)
round_participation31 = RoundParticipation.new(user: user2, round: round22, score: 3, rank: 3, end_time: Time.now)
round_participation32 = RoundParticipation.new(user: user2, round: round23, score: 7, rank: 2, end_time: Time.now)
round_participation33 = RoundParticipation.new(user: user3, round: round6, score: 47, rank: 1, end_time: Time.now)
round_participation34 = RoundParticipation.new(user: user3, round: round24, score: 83, rank: 6, end_time: Time.now)
round_participation35 = RoundParticipation.new(user: user3, round: round25, score: 95, rank: 5, end_time: Time.now)
puts "Some round participations have been created"

puts "Creating new visited pages..."
visited_pages1 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages2 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages3 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages4 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages5 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages6 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages7 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages8 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages9 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages10 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages11 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages12 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages13 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages14 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages15 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages16 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages17 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages18 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages19 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages20 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages21 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages22 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages23 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages24 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages25 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages26 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages27 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages28 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages29 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages30 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages31 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages32 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages33 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages34 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
visited_pages35 = VisitedPages.new(title: "Phare_de_Pumpkin_Island", url: "https://fr.wikipedia.org/wiki/La_Vengeance_des_zombies")
puts "Some visited pages have been created"

puts "Congratulation, your database is clean and has some elements from the seed"
