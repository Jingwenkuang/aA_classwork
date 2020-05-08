# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string           not null
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer          not null
#
class ShortenedUrl < ApplicationRecord
    validates :long_url, presence: true, uniqueness: true

    def self.random_code 
        short = SecureRandom.urlsafe_base64 
        while ShortenedUrl.exists?(short)
            short = SecureRandom.urlsafe_base64 
        end
        short
    end
end
