# == Schema Information
# Schema version: 20110316222024
#
# Table name: users
#
#  id                 :integer         not null, primary key
#  name               :string(255)
#  email              :string(255)
#  created_at         :datetime
#  updated_at         :datetime
#  encrypted_password :string(255)
#  salt               :string(255)
#

class User < ActiveRecord::Base
  attr_accessor :password
  attr_accessible :name,:email, :password,:password_confirmation,:salt
  
  validates :password, :presence => true, :confirmation => true, :length => { :within => 6..40 }, :on => :create
  validates :name, :presence => true,  :length => { :maximum => 50  }
    
  before_save :encrypt_password
  
  def self.authenticate(email,password)
    user = find_by_email(email)
    if user && user.encrypted_password = BCrypt::Engine.hash_secret(password, user.salt)
      user
    else
      nil
    end
    
  end
  
  private
  
  def encrypt_password
    if password.present?  
       self.salt = BCrypt::Engine.generate_salt  
       self.encrypted_password = BCrypt::Engine.hash_secret(password, salt)  
     end  
  end
  
  
 end
