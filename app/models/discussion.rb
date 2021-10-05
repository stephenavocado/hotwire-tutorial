class Discussion < ApplicationRecord
  belongs_to :user, default: -> { Current.user }

  validates :name, presence: true

  def to_param
    "#{id}-#{name.downcase.to_s[0...100]}".parameterize
    #.parameterize Replaces special characters in a string so that it may be used as part of a ‘pretty’ URL.
  end

end
