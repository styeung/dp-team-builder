require 'spec_helper'
require 'builder'

describe Builder do
  subject(:builder) { Builder.new }
  context 'setting up' do
    it "#build_fixture" do
      fixture = builder.build_fixture(4)
      expect(fixture.length).to eq 4
      expect(Builder::DEFAULT_POSITIONS).to include(fixture[3])
    end

    it "#build_fixtures" do
      fixture_list = builder.build_fixtures
      expect(fixture_list.length).to eq 50

    end
  end

  context 'solving optimal lineup' do
    let(:fixture_list) { builder.build_fixtures }

    it 'gives the optimal lineup' do
      optimal_lineups = builder.solve_lineup(fixture_list)

      expect(optimal_lineups.length).to be_greater_than 1
      expect(optimal_lineups).to have_key :amount_remaining
      expect(optimal_lineups).to have_key :lineup
      expect(optimal_lineups).to have_key :total_fp
    end
  end
end


