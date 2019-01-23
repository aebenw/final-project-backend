class ShallowUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :description, :file

  def file
      begin
        # FOR RUNNING JUST ACTIVE RECORD
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://249d3e9f.ngrok.io" + short_url

        # FOR RUNNING WITH s3
        # url = object.profile.service_url
        return url
      rescue
      return ''
      end
  end

end
