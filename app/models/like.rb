class Like::Like < ActiveRecord::Base
  self.table_name = 'like_likes'

  belongs_to :user,    polymorphic: true
  belongs_to :pin, polymorphic: true

  validates :user,    presence: true
  validates :pin, presence: true

  scope :with_user,    lambda { |liker|
    where user_type: liker.class.name, user_id: liker.id
  }
  scope :with_pin, lambda { |likeable|
    where pin_type: likeable.class.name, pin_id: likeable.id
  }

  def self.like(liker, likeable)
    create user: liker, pin: likeable
  end

  def self.liking?(liker, likeable)
    return false if liker.nil? || likeable.nil?

    with_liker(liker).with_likeable(likeable).count > 0
  end

  def self.unlike(liker, likeable)
    with_liker(liker).with_likeable(likeable).each &:destroy
  end
end