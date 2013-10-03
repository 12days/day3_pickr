class Friendrequests < ActiveRecord::Base
  belongs_to :invitee, class_name: :user
  belongs_to :inviter, class_name: :user
end
