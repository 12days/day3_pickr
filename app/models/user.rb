class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :uploads
  has_many :invited_friends, class_name: 'Friendrequest', foreign_key: 'inviter_id'
  has_many :friend_invites, class_name: 'Friendrequest' , foreign_key: 'invitee_id'
end
