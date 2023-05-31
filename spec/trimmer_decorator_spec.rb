require_relative '../trimmer_decorator'

describe TrimmerDecorator do
  before :each do
    person = double('Person', rental: [])
    allow(person).to receive(:age) { 12 }
    allow(person).to receive(:name) { 'simonchowdery' }
    allow(person).to receive(:parent_permission) { true }
    allow(person).to receive(:correct_name).and_return(person.name)
    @trimdecorator = TrimmerDecorator.new(person)
  end

  it 'checking for correct name method should return Trimme name' do
    expect(@trimdecorator.correct_name).to eq('simonchowd')
  end
end
