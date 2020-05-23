# == Schema Information
#
# Table name: users
#
#  id              :bigint           not null, primary key
#  username        :string           not null
#  password_digest :string           not null
#  session_token   :string           not null
#  created_at      :datetime         not null
#  updated_at      :datetime         not null
#
class User < ApplicationRecord
    validates :username, :session_token, presence: true, uniqueness: true 
    validates :password_digest, presence: true 
    validates :password, length: {minimum: 6, allow_nil: true}
    attr_reader :password 

    after_initialize :ensure_session_token 

    # first time login 
    # 1st initialize => password=(password) => after_initialize (ensure_session_token)
    #  => after instantial a new constance => user.save => run validation 

    # user.save  => validation (if pass) => save to database 

    # not the first time login 
    # 1st User.find_by_credentials("Wendy", '987654') => ensure_session_token => is_password?(password)
    # => initialize done (user intance) =>"when i hit user.password, will be nil, cuz only the first day 
    # login password create/save to database, second time/lateron we no longer create a password, but 
    # password_digest still exits" => password=(password)

#SPIRE
    def self.find_by_credentials(username, password)
         # debugger 
        user = User.find_by(username: username)
        user && user.is_password?(password)? user : nil 
    end

    def password=(password)
        # debugger 
        self.password_digest = BCrypt::Password.create(password)
        #new instance & save to database , new hash,salted password 
        #password_digest = same 
        @password = password 
    end

    def is_password?(password)
        #  debugger 
        BCrypt::Password.new(self.password_digest).is_password?(password)
    end

    def reset_session_token! # this method will call when we login 
        #  debugger 
        self.session_token = SecureRandom::urlsafe_base64
        self.save!
        self.session_token 
    end

    def ensure_session_token 
        # debugger 
        self.session_token ||= SecureRandom::urlsafe_base64 
    end 
end


# .new vs .create?