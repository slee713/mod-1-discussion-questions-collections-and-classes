# begin to build a simple program that models Instagram
# you should have a User class, a Photo class and a comment class
require 'pry'
class User
    attr_reader :name, :photos
    def initialize(name)
        @name = name
    end

    def photos
        Photo.all.find_all do |photo|
            photo.user == self
        end
    end

end

class Photo
    
    attr_accessor :user, :comments
    @@photos= []
    def initialize
        @comments = []
        @@photos << self
    end

    def self.all
        @@photos
    end

    def make_comment(comment)
        comment= Comment.new
        self.comments<<comment
    end
    
end

class Comment
    @@all = []
    def initialize
        @@all << self
    end

    def self.all
        @@all
    end

end

sandwich_photo = Photo.new
sophie = User.new("Sophie")
sandwich_photo.user = sophie
puts sandwich_photo.user.name
# => "Sophie"
puts sophie.photos
# => [#<Photo:0x00007fae2880b370>]


print sandwich_photo.comments
# => []

sandwich_photo.make_comment("this is such a beautiful photo of your lunch!! I love photos of other people's lunch")
print sandwich_photo.comments
# => [#<Comment:0x00007fae28043700>]

puts Comment.all
#=> [#<Comment:0x00007fae28043700>]
