class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :subject_type, :object_id, :object_type, :name, :checked, :actor, :receiver_id
  # attributes :actor

  def subject
  end

  def actor
    ShallowUserSerializer.new(object.actor)
  end

  # def receiver
  #
  # end


end
