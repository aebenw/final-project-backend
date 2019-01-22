class Activity < ApplicationRecord
  belongs_to :subject, polymorphic: true
  belongs_to :object, polymorphic: true
  belongs_to :actor, class_name: 'User'
  belongs_to :receiver, class_name: 'User'

end
