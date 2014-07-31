require 'spec_helper'

describe 'minidlna', :type => :class do
  let(:title) { 'minidlna::install' }

  context 'with default parameters' do
    it { should contain_package('minidlna')
        .with_ensure('present')
    }
  end

  context 'version => present' do
    let(:params) { {:version => 'present'} }

    it { should contain_package('minidlna')
        .with_ensure('present')
    }
  end

  context 'version => latest' do
    let(:params) { {:version => 'latest'} }

    it { should contain_package('minidlna')
        .with_ensure('latest')
    }
  end
end
