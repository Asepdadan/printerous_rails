class Person < ApplicationRecord
    has_one_attached :avatar
    belongs_to    :organization

    validates :name, presence: true
    validates :email, presence: true
    mount_uploader :avatar, AvatarUploader
end
