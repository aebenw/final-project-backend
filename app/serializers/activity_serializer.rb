class ActivitySerializer < ActiveModel::Serializer
  attributes :id, :actor, :objectt, :subjectt, :receiver, :name
  attr_accessor :receiver, :action_object

  def subjectt
    case object.name
    when 'ADD_BLOCK_TO_OWN_CHANNEL'
      ActivityBlockSerializer.new(object.subject)
    when "ADD_OTHER_BLOCK_TO_CHANNEL"
      ActivityBlockSerializer.new(object.subject)
    when "ADD_BLOCK_TO_OTHER_CHANNEL"
      ActivityBlockSerializer.new(object.subject)
    when "FOLLOW_CHANNEL"
      ShallowChannelSerializer.new(object.subject)
    when "BLOCK_COMMENT"
      # ALSO GETTING THIS INFORMATION BACK WITH THE ACTOR INFO, I NEED THE CONTENT OF THE COMMENT THOUGH, NOT THE AUTHOR INFORMATION
      ActivityCommentSerializer.new(object.subject)
    when 'CREATE_CHANNEL'
      ShallowChannelSerializer.new(object.subject)
    else
      nil
    end
  end

  def objectt
    if object.object != nil || object.name == "FRIENDSHIP"
      case object.name
      when 'FRIENDSHIP'
        ShallowUserSerializer.new(object.receiver)
      when 'FOLLOW_CHANNEL'
        ShallowUserSerializer.new(object.object)
      when "BLOCK_COMMENT"
        ActivityBlockSerializer.new(object.object)
      else
        ShallowChannelSerializer.new(object.object)
      end
    else
      nil
    end
  end

end
