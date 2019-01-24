class ActivityBlockSerializer < ActiveModel::Serializer
  attributes :id, :name, :content, :image, :file, :author

  def author
    ShallowUserSerializer.new(object.user)
  end

  def file
      begin
        # FOR RUNNING W JUST ACTIVE RECORD
        # short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        # url = "https://623c5e07.ngrok.io" + short_url

        # FOR RUNNING WITH s3
        url = object.file.service_url
        return url
      rescue
      return ''
      end
  end

end
