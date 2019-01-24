class ShallowChannelSerializer < ActiveModel::Serializer
  attributes :id, :name, :private, :authors

  def authors
    object.users.map{|user| ShallowUserSerializer.new(user)}
  end

end
