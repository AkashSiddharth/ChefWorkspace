#
# Cookbook:: cis_policy_inetd_services
# InSpec:: default
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

unless os.windows?
  # This is an example test, replace with your own test.
  describe user('root'), :skip do
    it { should exist }
  end
end

# This is an example test, replace it with your own test.
describe port(80), :skip do
  it { should_not be_listening }
end
