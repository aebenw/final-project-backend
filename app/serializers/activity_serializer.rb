class ActivitySerializer < ActiveModel::Serializer
  attributes :actor, :objectt, :subjectt, :receiver, :name
  attr_accessor :receiver, :action_object

  #NOTES ON REPEATING PROCESSES
  #FOR ADD_BLOCK_TO_OTHER_CHANNEL
    #Actor appears as both actor and as the author of the subjectt
    #Don't need the comments
  #BLOCK_COMMENT
    #Actor appears as both actor and as the author of the subjectt
  #CREATE_CHANNEL
    #Actor appears as both actor and as the author of the subjectt


  #Relationship and Follow Channel seem to be ok

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
      when "BLOCK_COMMENT"
        ActivityBlockSerializer.new(object.object)
      else
        ShallowChannelSerializer.new(object.object)
      end
    else
      nil
    end
  end

  # def actor
  #   ShallowUserSerializer.new(object.actor)
  # end
  #
  # def receiver
  #   if object.receiver
  #     ShallowUserSerializer.new(object.receiver)
  #   else
  #     nil
  #   end
  # end


end
