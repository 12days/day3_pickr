class Friendship < ActiveRecord::Base
  validates_uniqueness_of :user_id, scope: :friend_id
  validate :friend_is_not_self

  belongs_to :user
  belongs_to :friend, class_name: 'User'

  def friend_is_not_self
    errors.add("Cannot friend yourself.") if friend_id == user_id
  end
end
