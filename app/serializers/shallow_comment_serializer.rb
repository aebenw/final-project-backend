class ShallowCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :author

  def author
    object.is_a?(Comment) ? ShallowUserSerializer.new(object.user) : ShallowUserSerializer.new(object.object.user)
  end

end
