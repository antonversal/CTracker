namespace :data do

  desc "Load info about countries and currencies from server"
  task :randomize => :environment do
    UserCountry.delete_all
    User.select("users.id as user_id, countries.id as country_id").joins("INNER JOIN countries").each do |u|
      UserCountry.create!(user_id: u.user_id, country_id: u.country_id) if rand(2) == 1
    end
    UserCountry.all.each do |uc|
      uc.created_at = Time.now - rand(40).days
      uc.save!
    end
  end
end