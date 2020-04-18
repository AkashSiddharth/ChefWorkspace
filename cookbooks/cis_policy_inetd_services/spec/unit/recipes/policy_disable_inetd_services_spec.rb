#
# Cookbook:: cis_policy_inetd_services
# Spec:: policy_disable_inetd_services_spec
# Author:: Akash Siddharth
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
# Licensed under the, GNU General Public License v3.0 :
# Permissions of this strong copyleft license are conditioned on
# making available complete source code of licensed works and
# modifications, which include larger works using a licensed work,
# under the same license. Copyright and license notices must be preserved.
# Contributors provide an express grant of patent rights.
#

require 'spec_helper'

inet_services = %w(xinetd openbsd-inetd)

describe 'cis_policy_inetd_services::policy_disable_inetd_services' do
  # initialize a chef run
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  describe 'Do nothing' do
    inet_services.each do |svc_name|
      stubbed_cmd = "dpkg -l | grep #{svc_name}"

      before(:each) do
        stub_command(stubbed_cmd).and_return(false)
      end

      it "If #{svc_name} is not installed" do
        expect(chef_run).to_not remove_package("package_#{svc_name}_removed")
      end
    end
  end

  describe 'Removes the package' do
    inet_services.each do |svc_name|
      stubbed_cmd = "dpkg -l | grep #{svc_name}"

      before(:each) do
        stub_command(stubbed_cmd).and_return(true)
      end

      it "If #{svc_name} is installed" do
        expect(chef_run).to remove_package("package_#{svc_name}_removed")
      end
    end
  end
end
