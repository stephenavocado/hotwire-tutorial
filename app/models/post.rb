class Post < ApplicationRecord
  belongs_to :discussion, counter_cache: true, touch:true
  belongs_to :user, default: -> { Current.user }

  has_rich_text :body #comes from action_text, will store content of post

  validates :body, presence: true
end
