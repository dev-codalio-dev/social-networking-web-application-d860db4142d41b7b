# frozen_string_literal: true

class Comment < ApplicationRecord
  belongs_to :post
  belongs_to :author, class_name: "User"

  rhino_owner :post
  rhino_references [ :post, :author ]

  validates :content, presence: true
end
