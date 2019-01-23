class UserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :friends, :not_friends, :description, :file, :subscribed_channels
  has_many :channels, through: :user_channel, serializer: ShallowChannelSerializer

  def file
      begin
        # FOR RUNNING W JUST ACTIVE RECORD
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://249d3e9f.ngrok.io" + short_url

        # FOR RUNNING WITH s3
        # url = object.profile.service_url
        return url
      rescue
      return ''
      end
  end

  def relationships
    Relationship.friends(object)
  end

  def friends
    all_friends = object.followers + object.following
    friends_wo_current_user = all_friends.select{|friend| friend.id != object.id }
    return friends_wo_current_user
  end

  def not_friends
    not_friend = User.all - (object.followers + object.following)
    not_friends_wo_current_user = not_friend.select{|user| user.id !=  object.id }
    not_friends_wo_current_user.map{|user| ShallowUserSerializer.new(user)}
  end

  def subscribed_channels
    object.followed_channels.map{|x| ShallowChannelSerializer.new(x.channel)}
    rescue
    return ''
  end

end
