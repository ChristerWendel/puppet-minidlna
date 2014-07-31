require 'spec_helper'

describe 'minidlna', :type => :class do
  let(:title) { 'minidlna::service' }

  context 'with default parameters' do
    it { should contain_service('minidlna')
        .with_ensure('running')
        .with_enable('true')
    }
  end

  context 'enable => false' do
    let(:params) { {:enable => 'false'} }

    it { should contain_service('minidlna')
        .with_ensure('running')
        .with_enable('false')
    }
  end

  context 'start => false' do
    let(:params) { {:start => 'false'} }

    it { should contain_service('minidlna')
        .with_ensure('stopped')
        .with_enable('true')
    }
  end
end
