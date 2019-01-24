class ChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :authors, :blocks, :followers

  def blocks
    object.blocks.map{ |block| ShallowBlockSerializer.new(block)}
  end

  def authors
    object.users.map{|user| ShallowUserSerializer.new(user)}
  end

  def followers
    object.followers.map{|follower| ShallowUserSerializer.new(follower)}
  end

end
