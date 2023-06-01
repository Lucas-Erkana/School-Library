require_relative '../nameable'

describe Nameable do
  before :each do
    @nameable = Nameable.new
  end

  it 'checking for correct name with NotImplementedError' do
    expect { @nameable.correct_name }.to raise_error(NotImplementedError)
  end
end
