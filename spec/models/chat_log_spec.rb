require 'rails_helper'

RSpec.describe ChatLog, :type => :model do
  
  it "没有message就无法通过验证" do
    chat_log = build(:chat_log, message: nil)
    expect(chat_log).to have(1).errors_on(:message)
  end

end
