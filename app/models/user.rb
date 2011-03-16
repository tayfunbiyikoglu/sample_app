# == Schema Information
# Schema version: 20110315212714
#
# Table name: users
#
#  id         :integer         not null, primary key
#  name       :string(255)
#  email      :string(255)
#  created_at :datetime
#  updated_at :datetime
#

class User < ActiveRecord::Base
  attr_accessible :name,:email
  
  validates_presence_of :name,:email
  validates_length_of :name, :minimum => 2,:maximum => 6
end
