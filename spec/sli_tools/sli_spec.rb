# frozen_string_literal: true

require 'sli_tools'

require 'spec_helper'
require 'rspec/its'

RSpec.describe(SliTools::Sli) do
  subject do
    described_class.new('foo', 20, 1, slo)
  end

  context 'with a SLO of 0.9' do
    let(:slo) { SliTools::Slo.new(0.9) }

    its(:value) { is_expected.to be_within(Float::EPSILON).of(0.95) }
    its(:value_pct) { is_expected.to eq(' 95.000 %') }
    its(:error_budget_usage) { is_expected.to be_within(Float::EPSILON).of(0.5) }
  end
end
