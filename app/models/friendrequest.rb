class Friendrequest < ActiveRecord::Base
  belongs_to :invitee, class_name: 'User'
  belongs_to :inviter, class_name: 'User'

  validates_uniqueness_of :invitee_id, scope: [:inviter_id]

end
