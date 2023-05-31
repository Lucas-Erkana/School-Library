require_relative '../classes/classroom'

describe Classroom do
  before :each do
    @classroom = Classroom.new('Fifth')
  end

  it 'checking classroom instance' do
    expect(@classroom).to be_instance_of Classroom
  end

  it 'checking attributes' do
    expect(@classroom.label).to eq('Fifth')
  end

  it 'test for add student' do
    student = double('student')
    allow(student).to receive(:age) { '8' }
    allow(student).to receive(:name) { 'Arman' }
    allow(student).to receive(:parent_permission) { true }
    allow(student).to receive(:classroom=).and_return(Classroom)
    expect(@classroom.add_student(student).student[0].name).to eq('Arman')
  end
end
