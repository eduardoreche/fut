require 'spec_helper'

describe Subscriber do
  
  before(:each) do
    @attr = {
      first_name: "Firstname",
      last_name: "Lastname",
      email: "subscriber@example.com",
      accept_terms: true
    }
  end
  
  it "should create a new instance given a valid attribute" do
    Subscriber.create!(@attr)
  end

  it "should require an email address" do
    no_email_subscriber = Subscriber.new(@attr.merge(:email => ""))
    no_email_subscriber.should_not be_valid
  end

  it "should accept valid email addresses" do
    addresses = %w[user@foo.com THE_USER@foo.bar.org first.last@foo.jp]
    addresses.each do |address|
      valid_email_subscriber = Subscriber.new(@attr.merge(:email => address))
      valid_email_subscriber.should be_valid
    end
  end
  
  it "should reject invalid email addresses" do
    addresses = %w[user@foo,com user_at_foo.org example.user@foo.]
    addresses.each do |address|
      invalid_email_subscriber = Subscriber.new(@attr.merge(:email => address))
      invalid_email_subscriber.should_not be_valid
    end
  end
  
  it "should reject duplicate email addresses" do
    Subscriber.create!(@attr)
    subscriber_with_duplicate_email = Subscriber.new(@attr)
    subscriber_with_duplicate_email.should_not be_valid
  end

  it "should reject email addresses identical up to case" do
    upcased_email = @attr[:email].upcase
    Subscriber.create!(@attr.merge(:email => upcased_email))
    subscriber_with_duplicate_email = Subscriber.new(@attr)
    subscriber_with_duplicate_email.should_not be_valid
  end
  
  it "should reject first name with more than 20 chars" do
    subscriber = Subscriber.new(@attr.merge(first_name: ((0...21).map{(65+rand(26)).chr}.join)))
    subscriber.should_not be_valid
  end

  it "should reject first name with less than 3 chars" do
    subscriber = Subscriber.new(@attr.merge(first_name: "ab"))
    subscriber.should_not be_valid
  end
  
  it "should reject last name with more than 20 chars" do
    subscriber = Subscriber.new(@attr.merge(last_name: ((0...21).map{(65+rand(26)).chr}.join)))
    subscriber.should_not be_valid
  end

  it "should reject last name with less than 3 chars" do
    subscriber = Subscriber.new(@attr.merge(last_name: "ab"))
    subscriber.should_not be_valid
  end

  it "should reject email with more than 100 chars" do
    email = "r@" + ((0...100).map{(65+rand(26)).chr}.join)
    subscriber = Subscriber.new(@attr.merge(email: email ))
    subscriber.should_not be_valid
  end

  it "should reject last name with less than 3 chars" do
    subscriber = Subscriber.new(@attr.merge(email: "ab"))
    subscriber.should_not be_valid
  end
  
end
