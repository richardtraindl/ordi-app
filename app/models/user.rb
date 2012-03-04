require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password
 
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(userid, password)
    @user = User.find(userid)
    @user.has_password?(password) ? @user : nil
    
    # User.first(:conditions => ["id = ? AND encrypted_password = ?", userid, encrypt(password)])
  end
  
  private
    def encrypt_password
      self.salt = make_salt if new_record?
      self.encrypted_password = encrypt(password)
    end
  
    def encrypt(string)
      secure_hash("#{salt}--#{string}")
    end
  
    def make_salt
      secure_hash("#{Time.now.utc}--#{password}")
    end
  
    def secure_hash(string)
      Digest::SHA2.hexdigest(string)
    end  
end
