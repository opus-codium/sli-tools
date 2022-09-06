# frozen_string_literal: true

require 'sliinfo'

require 'spec_helper'

RSpec.describe(Sli) do
  let(:slo) { Slo.new(0.9) }

  subject do
    described_class.new('foo', 20, 1, slo)
  end

  describe '#value' do
    it 'returns the expected value' do
      expect(subject.value).to be_within(Float::EPSILON).of(0.95)
    end
  end

  describe '#value_pct' do
    it 'returns the expected value' do
      expect(subject.value_pct).to eq(' 95.000 %')
    end
  end

  describe '#error_budget_usage' do
    it 'returns the expected value' do
      expect(subject.error_budget_usage).to be_within(Float::EPSILON).of(0.5)
    end
  end
end
