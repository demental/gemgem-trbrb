describe 'The home page', type: :acceptance do

  it 'has some things' do
    Thing::Create[thing: { name: "Trailblazer" }]
    Thing::Create[thing: { name: "Rails" }]

    visit '/'
    save_and_open_page
    expect(page).to have_selector('.columns .header a', text: "Rails")
    expect(page).to have_selector('.columns.end .header a', count: 1)
    expect(page).to have_selector('.columns.end .header a', text: "Trailblazer")
  end
end
