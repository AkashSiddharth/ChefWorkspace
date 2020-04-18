#
# Cookbook:: cis_policy_inetd_services
# Spec:: default_spec
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

describe 'cis_policy_inetd_services::default' do
  let(:chef_run) { ChefSpec::SoloRunner.new(platform: 'ubuntu', version: '16.04').converge(described_recipe) }

  before do
    allow_any_instance_of(Chef::Recipe)
      .to receive(:include_recipe).with('cis_policy_inetd_services::policy_disable_inetd_services')
  end

  it 'includes the recipe policy_disable_inetd_services' do
    expect_any_instance_of(Chef::Recipe)
      .to receive(:include_recipe).with('cis_policy_inetd_services::policy_disable_inetd_services')
    chef_run
  end
end
