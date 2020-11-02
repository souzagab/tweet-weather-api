# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Weather do
  it { is_expected.to be_kind_of(Weather) }
  it { expect(described_class.ancestors).to include ActiveModel::Model }

  describe 'have acessors for' do
    it 'current' do
      subject.temp = 32
      expect(subject.temp).to eq(32)
    end

    it 'date' do
      date = Date.current
      subject.date = date
      expect(subject.date).to eq(date)
    end

    it 'description' do
      subject.description = 'Clouds'
      expect(subject.description).to eq('Clouds')
    end
  end
end
