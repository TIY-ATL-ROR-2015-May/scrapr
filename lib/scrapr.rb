$LOAD_PATH.unshift(File.dirname(__FILE__))

require 'pry'

require 'scrapr/version'
require 'scrapr/init_db'
require 'scrapr/github'
require 'scrapr/user'

module Scrapr
  class App
    def initialize
      @github = Github.new
    end

    def prompt(question, validator)
      puts question
      input = gets.chomp
      until input =~ validator
        puts "Sorry, wrong answer."
        puts question
        input = gets.chomp
      end
      input
    end

    def run
      username = prompt("What username would you like to download?", /^\w+$/)
      user_data = @github.get_user(username)
      User.create(user_data)
    end
  end
end

binding.pry

# app = Scrapr::App.new
# app.run
