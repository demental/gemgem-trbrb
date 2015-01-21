require 'spec_helper'

describe 'ThingCrud' do

  describe 'Create' do
    it 'persists valid' do
      thing = Thing::Create[thing:
          {name: 'rails', description: 'Kickass web dev'}
        ].model

      expect(thing.persisted?).to be_truthy
      expect(thing.name).to eq 'rails'
      expect(thing.description).to eq 'Kickass web dev'
    end

    it 'invalid' do
      res, op = Thing::Create.run(thing: {name: ''})

      expect(res).to be_falsey
      expect(op.model).not_to be_persisted
      expect(op.contract.errors.to_s).to eq "{:name=>[\"can't be blank\"]}"
    end
    it 'too short description' do
      res, op = Thing::Create.run(thing: {name: 'bla', description: 'foo'})
      expect(op.contract.errors.to_s).to eq "{:description=>[\"is too short (minimum is 4 characters)\"]}"
    end
  end
end
