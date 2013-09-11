namespace :db do
  desc "Populate database with dummy data"
  task :populate => :environment do
    full_reset

    dummy :posts, 100 do
      a = Post.new
      a.title = Faker::Lorem.sentence
      a.text = Faker::Lorem.paragraphs(10).map{|p| "<p>#{p}</p>"}.join
      a.save
    end
  end

  def full_reset
    Rake::Task['db:reset'].invoke
    FileUtils.rm_rf(Dir["#{Rails.root}/public/system/*"])
  end

  def dummy title, number=1
    puts "Creating dummy #{title}..."
    number.times { yield }
    puts "...done"
  end

end