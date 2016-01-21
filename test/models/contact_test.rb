require 'test_helper'

describe Contact do
  let(:contact_params){{email: 'user@example.com', name: 'John Smith', content: 'Lorem ipsum s fdfbdf bdf bdsfb sdf'}}
  let(:contact){ Contact.new contact_params }
  
  it 'a valid when created with valid parameters' do
    contact.must_be :valid?
  end
  
  values = [:email, :name, :content]
  
  values.each do |value|
    it "is invalid without a #{value}" do
      contact_params.delete value
      contact.wont_be :valid?
      contact.errors[value].must_be :present?
    end
  end
end