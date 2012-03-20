# == Schema Information
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  username           :string(255)     not null
#  encrypted_password :string(255)
#  salt               :string(255)
#  created_at         :datetime        not null
#  updated_at         :datetime        not null
#

require 'digest'

class User < ActiveRecord::Base
  attr_accessor :password

 
  before_save :encrypt_password

  def has_password?(submitted_password)
    encrypted_password == encrypt(submitted_password)
  end

  def self.authenticate(id, submitted_password)
    @user = find_by_id(id)
    return nil if @user.nil?
    return @user if @user.has_password?(submitted_password)
  end
  
  def self.authenticate_with_salt(id, cookie_salt)
    @user = find_by_id(id)
    (@user && @user.salt == cookie_salt) ? @user : nil
  end 
  
  def self.current
    Thread.current[:user]
  end

  def self.current=(user)
    Thread.current[:user] = user
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
