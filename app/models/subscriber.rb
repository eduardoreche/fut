class Subscriber < ActiveRecord::Base
  attr_accessible :accept_terms, :email, :first_name, :last_name
  
  validates_presence_of :first_name, :last_name, :email
  validates_length_of :first_name, :within => 3..20
  validates_length_of :last_name, :within => 3..20
  validates_length_of :email, :within => 6..100
  
  validates_format_of :email, with: Devise.email_regexp
  validates_uniqueness_of :email, case_sensitive: false
  validates :accept_terms, acceptance: {accept: true}
end
