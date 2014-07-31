require 'spec_helper'

describe 'minidlna', :type => :class do
  let(:title) { 'minidlna::configure' }

  context 'with default params' do
    it { should contain_file('/etc/minidlna.conf')
        .with_content(/media_dir=V,\/home/)
    }
  end

  context 'single share' do
    let(:params) { {:shares =>
        [
         {'type' => 'V', 'path' => '/home/minidlna'}
        ]
      }
    }

    it { should contain_file('/etc/minidlna.conf')
        .with_content(/media_dir=V,\/home\/minidlna/)
    }
  end

  context 'multiple shares' do
    let(:params) { {:shares => 
        [
         {'type' => 'V', 'path' => '/home/video'},
         {'type' => 'A', 'path' => '/home/audio'}
        ]
      }
    }

    it { should contain_file('/etc/minidlna.conf')
        .with_content(/media_dir=V,\/home\/video/)
        .with_content(/media_dir=A,\/home\/audio/)
    }
  end

  context 'host name' do
    let(:facts) { {:fqdn => 'www.example.com'} }

    it { should contain_file('/etc/minidlna.conf')
        .with_content(/presentation_url=http:\/\/www.example.com/)
        .with_content(/friendly_name=www.example.com/)
    }
  end
end
