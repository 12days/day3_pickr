class Friendrequest < ActiveRecord::Base
  validates_uniqueness_of :invitee_id, scope: [:inviter_id]
  validates_presence_of :invitee_id, :inviter_id
  validate :unique_columns

  belongs_to :invitee, class_name: 'User'
  belongs_to :inviter, class_name: 'User'

  def unique_columns
    errors.add(:invitee_id, 'Cannot friend yourself') if invitee_id == inviter_id
  end
end
