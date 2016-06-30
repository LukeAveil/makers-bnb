describe Calendar do

  subject(:calendar) { described_class.new([Date.parse('2016-09-12')]) }

  it 'starts with a year, month, and available days' do
    expect(subject.year).to eq 2016
    expect(subject.month).to eq 9
  end

  it 'returns a hash of dates in the month with true for available dates' do
    expect(subject.list_dates).to include(Date.parse("2016-09-01"))
    expect(subject.list_dates).to include(Date.parse("2016-09-12"))
  end

  it 'goes forward a month' do
    subject.forward
    expect(subject.month).to eq 10
  end

  it 'can go forward to a new year' do
    4.times {subject.forward}
    expect(subject.month).to eq 1
    expect(subject.year).to eq 2017
  end

  it 'goes back a month' do
    subject.backward
    expect(subject.month).to eq 8
  end

  it 'can go backwards to a previous year' do
    9.times {subject.backward}
    expect(subject.month).to eq 12
    expect(subject.year).to eq 2015
  end

end
