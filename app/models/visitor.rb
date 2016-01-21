require 'digest'

class Visitor
  include ActiveModel::Model
  attr_accessor :email, :string
  attr_accessor :name, :string
  
  validates_presence_of :email
  validates_format_of :email, with: /\A[-a-z0-9_+\.]+\@([-a-z0-9]+\.)+[a-z0-9]{2,4}\z/i
  
  def subscribe
    mailchimp = Gibbon::Request.new(api_key: Rails.application.secrets.mailchimp_api_key)
    list_id = Rails.application.secrets.mailchimp_list_id
    
    #result = mailchimp.lists(list_id).members.create(
    #body:{
    #  email_address: self.email,
    #  status: 'subscribed'
    #})
    md5 = Digest::MD5.new
    md5.update self.email.downcase
    md5email = md5.hexdigest
    result = mailchimp.lists(list_id).members(md5email).upsert(
      body: {
        email_address: self.email,
        status: "subscribed",
        merge_fields: {FNAME: "#{self.name}"}
      })
    Rails.logger.info("Subscribed #{self.email.downcase} to MailChimp") if result
  end
  
end