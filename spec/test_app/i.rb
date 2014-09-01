#!/usr/bin/env ruby

system("rm -Rf db/migrate/*")
system "rake mini_bi_engine:install:migrations"
files = `ls db/migrate`.split(/\n/)
FILTER = ARGV.first
files.each{|file| system("rm db/migrate/#{file}") unless file.include?(FILTER)}
ActiveRecord::Base.connection.execute "drop table glb.#{FILTER.pluralize}" rescue nil
system "rake db:migrate RAILS_ENV=#{ARGV[1]}"

