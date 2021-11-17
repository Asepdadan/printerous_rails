class Organization < ApplicationRecord
    has_one_attached :logo
    has_many    :person

    validates :name, presence: true
    validates :email, presence: true
    mount_uploader :logo, LogoUploader
end
