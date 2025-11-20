# frozen_string_literal: true

class Follow < ApplicationRecord
  belongs_to :follower, class_name: "User"
  belongs_to :followee, class_name: "User"

  rhino_owner :follower
  rhino_references [ :follower, :followee ]

  validates :follower_id, uniqueness: { scope: :followee_id, message: "already follows this user" }
  validate :cannot_follow_self

  private

    def cannot_follow_self
      if follower_id == followee_id
        errors.add(:base, "User cannot follow themselves")
      end
    end
end
