#
# Cookbook:: cis_policy_inetd_services
# Recipe:: policy_disable_inetd_services
# Author:: Akash Siddharth
#
# Copyright:: 2020, The Authors, All Rights Reserved.
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

inet_services = node[cookbook_name]['inetd']['services']

# if the platform family is debian
if node["platform_family"] == "debian"
    # Remove the unsafe inetd packages
    inet_services.each do |service_name|
        # Calling the resource to purge the package, if installed
        package "Package: #{service_name} removed" do
            action          :remove
            package_name    service_name
            only_if         "dpkg -l | grep #{service_name}"
        end # End of dpkg_package resource
    end # End of loop
end # end of if-block