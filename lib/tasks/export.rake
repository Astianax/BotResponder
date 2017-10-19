namespace :export do
  desc "Prints Response.all in a seeds.rb way."
  task :seeds_format => :environment do
    Response.order(:id).all.each do |response|
      puts "Response.create(#{response.serializable_hash.delete_if {|key, value| 
      				['created_at','updated_at','id'].include?(key)
      				}.to_s.gsub(/[{}]/,'')})"
    end
  end
end