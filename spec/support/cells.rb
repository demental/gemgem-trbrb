module Cell
  module Rspec
    private
    def concept(name, *args)
      controller_stub = double(
        url_options: {
          host: '',
          optional_port: 80,
          protocol: 'http',
          path_parameters: ''
        }
      )
      Capybara.string(Cell::Concept.cell name, controller_stub, *args)
    end
  end
end

RSpec.configure do |config|
  config.include Cell::Rspec, type: :cell
end
