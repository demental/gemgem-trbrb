
describe ThingsController, type: :controller do
  render_views

  describe '#create' do
    it do #valid
      expect(post :create, thing: {name: "Bad Religion"}).to redirect_to thing_path(Thing.last)
    end

    it do #invalid
      post :create, thing: {name: ""}
      expect(response.body).to have_selector('.error')
    end
  end
end
