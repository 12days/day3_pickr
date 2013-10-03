class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :uploads
  has_many :friendrequests, foreign_key: 'inviter_id',
                            class_name: 'Friendrequest'
  has_many :invited_friends, through: :friendrequests, source: 'invitee'

end
