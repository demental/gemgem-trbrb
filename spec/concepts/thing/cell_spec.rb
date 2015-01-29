describe 'ThingCell', type: :cell do

  let(:rails) { Thing::Create[thing: {name: "Rails" }].model }
  let(:trb)   { Thing::Create[thing: {name: "Trailblazer" }].model }

  subject { concept('thing/cell', collection: [rails, trb], last: trb) }

  it do
    expect(subject).to have_selector('.columns .header a', text: "Rails")
    expect(subject).to have_selector('.columns.end .header a', count: 1)
    expect(subject).to have_selector('.columns.end .header a', text: "Trailblazer")
  end

end
