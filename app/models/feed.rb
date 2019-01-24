class Feed < ApplicationRecord
  belongs_to :user
  has_many :feed_activities
  has_many :activities, through: :feed_activities

  # def self.initialize(user)
  #   current_user = User.find(user)
  #   activity = Hash.new
  #   initial_activity = []
  #   stored_activity = []
  #   friends = current_user.friends
  #
  #   i = 0
  #   100.times do |x|
  #     if i <= 10
  #       friend = friends.sample
  #       Ac
  #   end
  #   friends.map {|friend|
  #     arr.push(Activity.where(actor_id: friend.id).order('created_at DESC').limit(10))
  #   }
  #   return arr.shuffle
  # end

  #
  #å
  #   10.times do |z|
  #     friend = friends.sample
  #     num = rand(4)
  #     num2 = rand(4)
  #
  #       if num == 0
  #         user = ShallowUserSerializer.new(friend).attributes
  #         channels = friend.channels.sample(num2).map{ |x| ShallowChannelSerializer.new(x)}
  #         item = {
  #           type: "channels",
  #           user: user,
  #           content: channels
  #         }
  #         arr << item
  #       elsif num == 1
  #         user = ShallowUserSerializer.new(friend).attributes
  #         blocks = friend.blocks.sample(num2).map{ |x| ShallowBlockSerializer.new(x)}
  #         item = {
  #           type: "blocks",
  #           user: user,
  #           content: blocks
  #         }
  #         arr << item
  #
  #
  #       elsif num == 2
  #         user = ShallowUserSerializer.new(friend).attributes
  #         feed_friends = friend.friends.sample(num2).map{ |x| ShallowUserSerializer.new(x)}
  #         item = {
  #           type: "friends",
  #           user: user,
  #           content: feed_friends
  #         }
  #         arr << item
  #
  #
  #       elsif num == 3
  #         user = ShallowUserSerializer.new(friend).attributes
  #         channels = friend.followed_channels.sample(num2).map{ |x| ShallowChannelSerializer.new(x.channel)}
  #
  #         item = {
  #           type: "followed_channels",
  #           user: user,
  #           content: channels
  #         }
  #         arr << item
  #
  #       end
  #   end
  #   json[:feed] = arr
  #   return json
  # end


end
