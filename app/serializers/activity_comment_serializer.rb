class ActivityCommentSerializer < ActiveModel::Serializer
  attributes :id, :content, :block


  def block
    ActivityBlockSerializer.new(object.block)
  end
end
