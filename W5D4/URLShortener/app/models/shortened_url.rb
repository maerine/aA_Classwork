# == Schema Information
#
# Table name: shortened_urls
#
#  id         :bigint           not null, primary key
#  long_url   :string
#  short_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  user_id    :integer
#
# Indexes
#
#  index_shortened_urls_on_short_url  (short_url) UNIQUE
#

class ShortenedUrl < ApplicationRecord
    validates :short_url, presence: true, uniqueness: true
    def self.random_code
        while 
            r_v = SecureRandom.urlsafe_base64
            break if !exists?(r_v)
        end
        r_v
    end
    def self.make_with_url(url)
        ret = ShortenedUrl.new
        ret.long_url = url
        ret.short_url = ShortenedUrl.random_code
        ret
    end
    belongs_to :submitter,
    primary_key: :id,
    foreign_key: :user_id,
    class_name: :User
end

