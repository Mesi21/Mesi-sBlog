require 'spec-helper.rb'

RSpec.describe User, type: :model do
  subject { User.new(name: 'Mesi', photo: 'https://i.picsum.photos/id/1011/5472/3648.jpg?hmac=Koo9845x2akkVzVFX3xxAc9BCkeGYA9VRVfLE4f0Zzk', bio: 'Web developer from Romania.') }

  before { subject.save }

  it 'name should exist' do
    subject.name = nil
    expect(subject).to_not be_valid
  end
end