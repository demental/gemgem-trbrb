RSpec.configure do |config|
  config.before(:each) do
    Thing.destroy_all
  end
end
