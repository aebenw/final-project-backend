class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :subject_id, :subject_type, :object_id, :object_type, :name, :checked, :actor_id, :receiver_id



end
