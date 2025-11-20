# frozen_string_literal: true

class Like < ApplicationRecord
  belongs_to :post
  belongs_to :liker, class_name: "User"

  rhino_owner :post
  rhino_references [ :post, :liker ]

  validates :liker_id, uniqueness: { scope: :post_id, message: "can only like a post once" }
end
