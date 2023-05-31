require_relative '../classes/book'

describe Book do
  before :each do
    @book = Book.new 'JS Basic', 'SK Siku'
  end

  it 'checking book instance' do
    expect(@book).to be_instance_of Book
  end

  it 'checking attributes' do
    expect(@book).to have_attributes(title: 'JS Basic', author: 'SK Siku')
  end

  it 'test for add_rental' do
    person = double('Person', rental: [])
    allow(person).to receive(:age) { '12' }
    allow(person).to receive(:name) { 'SK Siku' }
    allow(person).to receive(:parent_permission) { true }
    rental = @book.add_rental(person, '2323-23-23')
    puts rental.person.age
    expect(rental.person.name).to eq('SK Siku')
  end
end
