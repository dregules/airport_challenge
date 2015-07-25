require 'plane'

## Note these are just some guidelines!
## Feel free to write more tests!!

# When we create a new plane, it should be "flying",
# thus planes can not be created in the airport.
#
# When we land a plane at the airport, the plane in question should
# be "landed"
#
# When the plane takes of from the airport, it should be "flying" again
#
# Think about your implementation - does it allow a plane to be "flying" and landed?
# Are you testing that?

describe Plane do
let(:airport) {double(:airport, {:full? => false })}

  it 'is flying when created' do
    expect(subject.landed).to be false
  end

  it 'can land somewhere'do
    expect(subject).to respond_to(:land).with(1).argument
  end

  it 'lands at the airport' do
    subject.land(airport)
    expect(subject.airport).to eq airport
  end

  it 'is landed after landing' do
    subject.land :airport
    expect(subject.landed).to be true
  end

  it 'can take off' do
    subject.land :airport
    expect(subject).to respond_to :take_off
  end

  it 'cannot take off if flying' do
    subject.landed = false
    expect{subject.take_off}.to raise_error "Plane cannot take off, it's already flying!"
  end

  it 'is flying after take off' do
    subject.land :airport
    subject.take_off
    expect(subject.landed).to be false
  end

end
