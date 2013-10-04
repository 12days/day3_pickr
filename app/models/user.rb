class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_many :uploads

  has_many :friendships
  has_many :friends, through: :friendships
  has_many :inverse_friendships, class_name: 'Friendship', foreign_key: 'friend_id'
  has_many :inverse_friends, through: :inverse_friendships, source: :user

  def sent_invites
    inverse = inverse_friend_ids
    sent = friend_ids.select{|id| !inverse.include?(id) }
    friendships.where("friend_id = ?", sent)
  end

  def received_invites
    sent = friend_ids
    inverse = inverse_friend_ids.select{|id| !sent.include?(id) }
    inverse_friendships.where("user_id = ?", inverse)
  end

  def true_friendships
    inverse = inverse_friend_ids
    accepted = friend_ids.select{|id| inverse.include?(id) }
    friendships.where("friend_id = ?", accepted)
  end

  def add_friend(user)
    Friendship.create!(user_id: self.id, friend_id: user.id)
  end

  def remove_friend(user)
    Friendship.all.where(user_id: self.id, friend_id: user.id).delete_all
    Friendship.all.where(user_id: user.id, friend_id: self.id).delete_all
  end

  def self.friends?(user_a, user_b)
    (Friendship.all.where(user_id: user_a.id, friend_id: user_b.id) +
     Friendship.all.where(user_id: user_a.id, friend_id: user_a.id)).count == 2
  end
end
