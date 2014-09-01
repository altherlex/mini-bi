# desc "Explaining what the task does"
# task :mini-bi do
#   # Task goes here
# end
namespace :widget do 
  desc "load data for widgets"
  task :load_query => :environment do |task, args|
    p = 
      if ENV['widget_id'].nil? || ENV['widget_id']==':first'
        :first
      else
        ENV['widget']
      end
    widget = Widget.find p
    if widget
      puts widget.load_query
    end
  end
end #namespace widget

# usage:
# rake csv:users:all => export all users to ./user.csv
# rake csv:users:range start=1757 offset=1957 => export users whose id are between 1757 and 1957
# rake csv:users:last number=3   => export last 3 users
namespace :csv do
  namespace :widget do 
    desc "load data for widgets"
    task :load_query => :environment do |task, args|
      widget = Widget.find(ENV['widget_id'])
      if widget
        puts widget.universe.load_query
      end
    end
  end #namespace widget
  namespace :multiverse do
    desc "export all users to a csv file"
    task :all => :environment do
      export_to_csv Universe.all
    end

=begin
    desc "export users whose id are within a range to a csv file"
    task :range => :environment do |task, args|
      export_to_csv User.where("id >= ? and id < ?", ENV['start'], ENV['offset'])
    end

    desc "export last #number users to a csv file"
    task :last => :environment do |task, arg|
      export_to_csv User.last(ENV['number'].to_i)
    end
=end
    def export_to_csv(users)
      CSV.open("./user.csv", "wb") do |csv|
        csv << Universe.attribute_names
        users.each do |user|
          csv << user.attributes.values
        end
      end
    end #export_to_csv
  end
end
