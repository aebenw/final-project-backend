class ShallowUserSerializer < ActiveModel::Serializer
  attributes :id, :name, :email, :description, :file

  def file
      begin
        # FOR RUNNING JUST ACTIVE RECORD
        short_url = Rails.application.routes.url_helpers.rails_blob_path(object.file, only_path: true)
        url = "https://36cda730.ngrok.io" + short_url

        # FOR RUNNING WITH s3
        # url = object.profile.service_url
        return url
      rescue
      return ''
      end
  end

end
