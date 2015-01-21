
describe ThingsController, type: :controller do
  describe '#create' do
    it do #valid
      expect(post :create, thing: {name: "Bad Religion"}).to redirect_to thing_path(Thing.last)
    end

    it do #invalid
    end
  end
end
