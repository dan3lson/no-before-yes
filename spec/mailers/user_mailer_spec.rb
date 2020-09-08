require 'rails_helper'

RSpec.describe UserMailer, type: :mailer do
  let!(:user) { create(:user) }
  let(:mail) { UserMailer.with(user: user).welcome }
  let(:from_address) { 'hello@nobeforeyes.com' }

  it 'renders the headers' do
    expect(mail.subject).to eq('Thanks for signing up')
    expect(mail.to).to eq([user.email])
    expect(mail.from).to eq([from_address])
  end

  it 'renders the body cta' do
    expect(mail.body.encoded).to match('Get started')
  end
end
