class CommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :author

  def author
    ShallowUserSerializer.new(object.user)
  end

end
