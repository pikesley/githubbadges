require 'spec_helper.rb'

module Badgerise
  context 'colour' do
    it 'sets a colour' do
      expect(Badgerise.colour 0).to eq 'brightgreen'
      expect(Badgerise.colour 2).to eq 'blue'
      expect(Badgerise.colour 4).to eq 'orange'
      expect(Badgerise.colour 8).to eq 'red'
      expect(Badgerise.colour 'derp').to eq 'red'
    end

    it 'sets a label' do
      expect(Badgerise.label 'issues').to eq 'open%20issues'
      expect(Badgerise.label 'pulls').to eq 'pending%20pull--requests'
      expect(Badgerise.label 'unchanged').to eq 'unchanged'
    end
  end
end
