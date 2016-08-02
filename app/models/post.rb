class Post < ApplicationRecord
  acts_as_votable
  belongs_to :user
  has_attached_file :image, styles: { medium: "700x500#", small: "150x150#" }
  validates_attachment_content_type :image, content_type: /\Aimage\/.*\Z/
  has_many :comments
end
