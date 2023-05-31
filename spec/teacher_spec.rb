require_relative '../teacher'

describe Teacher do
  before :each do
    @teacher = Teacher.new(30, 'Simon', 'true')
  end

  it 'checking teacher instance' do
    expect(@teacher).to be_instance_of Teacher
  end

  it 'can use services' do
    expect(@teacher.can_use_service?).to be true
  end
end
