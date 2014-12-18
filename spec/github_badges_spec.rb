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

    it 'generates a target url' do
      expect(Badgerise.target 'issues', 4).to eq 'http://img.shields.io/badge/open%20issues-4-orange.svg'
      expect(Badgerise.target 'pulls', 1).to eq 'http://img.shields.io/badge/pending%20pull--requests-1-blue.svg'
    end

    it 'extracts an extension' do
      expect(Badgerise.get_extension 'this.svg').to eq 'svg'
      expect(Badgerise.get_extension 'that.png').to eq 'png'
      expect(Badgerise.get_extension 'this.has.no.extension').to eq 'svg'
    end

    it 'extracts the non-extension string' do
      expect(Badgerise.without_extension 'some.name'). to eq 'some.name'
      expect(Badgerise.without_extension 'some.other.name.png'). to eq 'some.other.name'
      expect(Badgerise.without_extension 'more-name.svg'). to eq 'more-name'
    end
  end
end
