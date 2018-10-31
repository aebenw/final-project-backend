# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
eben = User.create(name: "Eben", email: "e@e.com", password: "test")
chris = User.create(name: "Chris", email: "c@c.com", password: "test")
joanna = User.create(name: "Joanna", email: "j@j.com", password: "test")
danny = User.create(name: "Danny", email: "d@d.com", password: "test")


Relationship.create(follower_id: eben.id,  followed_id: chris.id)
Relationship.create(follower_id: eben.id,  followed_id: joanna.id)
Relationship.create(follower_id: joanna.id,  followed_id: danny.id)
Relationship.create(follower_id: chris.id,  followed_id: danny.id)

30.times { |x|
  Channel.create(name: Faker::Hipster.sentence(3))
}

def user_channel
  i = 1
  while i < Channel.all.length
  user = User.all.sample
  channel = Channel.find(i)
  UserChannel.create(user_id: user.id, channel_id: channel.id)
  i +=1
  end
end

50.times  { |x|
  # NEED TO ADD IMG/CONTENT
  user = User.all.sample
  Block.create(user_id: user.id, content: Faker::Hipster.paragraphs(1))
}


def channel_blocks

  i = 1
  while i < 51
  block = Block.find(i)
    if i < 32
      ChannelBlock.create(block_id: block.id, channel_id: i)
      i += 1
    else
      channel = Channel.all.sample
      ChannelBlock.create(block_id: block.id, channel_id: channel.id)
      i += 1
    end
  end
end

100.times { |x|
  user = User.all.sample
  block = Block.all.sample
  Comment.create(user_id: user.id, block_id: block.id)
}

100.times{ |x|
  user = User.all.sample
  block = Block.all.sample
  Like.create(user_id: user.id, block_id: block.id)
 }


channel_blocks
user_channel
