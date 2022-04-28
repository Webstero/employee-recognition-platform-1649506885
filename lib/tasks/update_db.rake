namespace :update_db do
  desc 'Update DB about number of available kudos'
  task update_number_of_kudos: :environment do
    Employee.all.each do |t|
      t.update!(number_of_available_kudos: 10 - Kudo.where(giver_id: t.id).count)
    end
  end
end
