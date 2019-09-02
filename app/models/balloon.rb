class Balloon < ApplicationRecord
    validates :title, presence: true, length: {minimum:3}
    has_many :comments
end
