require 'spec_helper'

describe 'bacula' do
  let(:title) { 'bacula' }

  ['Debian', 'RedHat'].each do |osfamily|
    describe "bacula class without any parameters on #{osfamily}" do 
      let(:params) {{ }}
      let(:facts) { { :osfamily => osfamily } }

      it { should create_class('bacula') }
      it { should create_package('bacula') }
      it { should create_file('/etc/bacula.conf') }
      it {
        should create_file('/etc/bacula.conf')\
        .with_content(/^server pool.bacula.org$/)
      }
      if osfamily == 'RedHat' 
        it { should create_service('baculad') }
      else
        it { should create_service('bacula') }
      end
    end
  end
end
