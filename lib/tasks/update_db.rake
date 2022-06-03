namespace :update_db do
  desc 'Update DB about number of available kudos'
  task update_number_of_kudos: :environment do
    Employee.all.each do |t|
      t.update!(number_of_available_kudos: 10 - Kudo.where(giver_id: t.id).count)
    end
  end

  desc 'Update DB about number of earned points'
  task update_earned_points: :environment do
    Employee.all.each do |t|
      t.update!(earned_points: Kudo.where(receiver_id: t.id).count)
    end
  end
end
