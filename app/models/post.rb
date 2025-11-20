# frozen_string_literal: true

class Post < ApplicationRecord
  belongs_to :organization
  belongs_to :author, class_name: "User"
  has_many :comments, dependent: :destroy
  has_many :likes, dependent: :destroy

  has_one_attached :image

  rhino_owner :organization
  rhino_references [ :organization, :author ]

  validates :content, presence: true
end
