# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  user_name       :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    attr_reader :password 

    validates :user_name, presence: true
    validates :password_digest, :session_token, presence: true, uniqueness: true

    after_initialize :ensure_session_token


    has_many :cats,
        foreign_key: :user_id,
        class_name: :Cat 

    def reset_session_token!
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token 
    end

    def password= (password)
        self.password_digest = BCrypt::Password.create(password)
        @password = password 
    end
    # self.password_digest = BCrypt::Password.create(password) # hashes the password and sets it on instance
    # @password = password # creates instance variable of password for validations

    def is_password?(password)
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end
    # calls the is_password? method on an instance of BCrpt::Password to check the password argument


    def self.find_by_credentials(user_name, password)
        user = User.find_by(user_name: user_name)  
        #model.find_by(name: "Bob")
        user && user.is_password?(password) ? user : nil
    end
end

# ?? is_password(password)
 

