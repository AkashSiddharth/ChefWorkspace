#
# Cookbook:: cis_policy_inetd_services
# Recipe:: policy_disable_inetd_services
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

cookbook_name = 'cis_policy_inetd_services'
inet_services = node[cookbook_name]['inetd']['services']

# if the platform family is debian
if platform_family?('debian')
  # Remove the unsafe inetd packages
  inet_services.each do |service_name|
    # Calling the resource to purge the package, if installed
    package "package_#{service_name}_removed" do
      action          :remove
      package_name    service_name
      only_if         "dpkg -l | grep #{service_name}"
    end # End of dpkg_package resource
  end # End of loop
end # end of if-block
