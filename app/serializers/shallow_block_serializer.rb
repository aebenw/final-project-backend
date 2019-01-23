class ShallowBlockSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :author, :comments, :image, :file

  def author
    ShallowUserSerializer.new(object.user)
  end

  def comments
    object.comments.map{|comment| ShallowCommentSerializer.new(comment)}
  end

  def file
      begin
        # FOR RUNNING W JUST ACTIVE RECORD
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://729b7733.ngrok.io" + short_url

        # FOR RUNNING WITH s3
        # url = object.file.service_url
        return url
      rescue
      return ''
      end
  end

end
