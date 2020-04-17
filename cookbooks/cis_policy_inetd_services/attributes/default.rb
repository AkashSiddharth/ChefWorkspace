#
# Cookbook:: cis_policy_inetd_services
# Attributes:: default
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

default[cookbook_name]['inetd']['services'] = [ "xinetd",
                                                "openbsd-inetd" ]

