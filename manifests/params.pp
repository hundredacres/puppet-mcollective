# Class: mcollective::params
#
# This class defines default parameters used by the main module class mcollective
# Operating Systems differences in names and paths are addressed here
#
# == Variables
#
# Refer to mcollective class for the variables defined here.
#
# == Usage
#
# This class is not intended to be used directly.
# It may be imported or inherited by other classes
#
class mcollective::params {

  ### Class specific parameters
  $dependencies_class = 'mcollective::dependencies'

  $stomp_host = 'localhost'
  $stomp_port = '61613'
  $stomp_user = 'mcollective'
  $stomp_password = 'secret'
  $client_stomp_user = 'mco'
  $client_stomp_password = 'mco123'
  $stomp_admin = 'mcollective_admin'
  $stomp_admin_password = 'secret!'

  $memory_usage = '100 mb'
  $store_usage = '1 gb'
  $temp_usage = '100 mb'

  $install_client = false
  $install_stomp_server = false
  $install_plugins = true
  $psk = 'th1s_1s_someTHING_diff1cult2guess!butNOTsoSAFE!!'

  $server_identity = $::fqdn

  $register_interval = 0

  $package_client = $::operatingsystem ? {
    default => 'mcollective-client',
  }

  $package_provider   = $::operatingsystem ? {
    default => undef,
  }

  $config_file_client = $::puppetversion ? {
    /^4/    => '/etc/puppetlabs/mcollective/client.cfg',
    default => '/etc/mcollective/client.cfg',
  }

  $template_factsyml       = 'mcollective/facts.yml.erb'
  $filter_factsyml       = '(uptime.*|last_run|manage_file_content|classvars|path|timestamp|free|.*password.*|.*psk.*|.*key)'

  $template_client = ''
  $template_stomp_server = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'mcollective/ubuntu_activemq.xml.erb',
    default                   => 'mcollective/activemq.xml.erb',
  }

  $daemonize = $::operatingsystem ? {
#    Ubuntu   => '0',
    default  => '1',
  }

  ### Application related parameters

  $package = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'mcollective',
    default                   => 'mcollective',
  }

  $package_dependencies = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'ruby-stomp',
    default                   => 'rubygem-stomp',
  }

  $service = $::operatingsystem ? {
    default => 'mcollective',
  }

  $service_status = $::operatingsystem ? {
    ubuntu  => false,
    default => true,
  }

  $process = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => 'mcollectived',
    default                   => 'ruby',
  }

  $process_args = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '',
    default                   => 'mcollectived',
  }

  $process_user = $::operatingsystem ? {
    default => 'root',
  }

  $config_dir = $::puppetversion ? {
    /^4/    => '/etc/puppetlabs/mcollective',
    default => '/etc/mcollective',
  }

  $config_file = $::puppetversion ? {
    /^4/    => '/etc/puppetlabs/mcollective/server.cfg',
    default => '/etc/mcollective/server.cfg',
  }

  $config_file_mode = $::operatingsystem ? {
    default => '0640',
  }

  $config_file_owner = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_group = $::operatingsystem ? {
    default => 'root',
  }

  $config_file_init = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/etc/default/mcollective',
    default                   => '/etc/sysconfig/mcollective',
  }

  $pid_file = $::operatingsystem ? {
    default => '/var/run/mcollectived.pid',
  }

  # This is the libdir in the configuration file
  # Here plugins are stored
  $data_dir = $::operatingsystem ? {
    /(?i:Debian|Ubuntu|Mint)/ => '/usr/share/mcollective/plugins',
    default                   => '/usr/libexec/mcollective:/opt/puppetlabs/mcollective/plugins',
  }

  $log_dir = $::operatingsystem ? {
    default => '/var/log/mcollective',
  }

  $log_file = $::puppetversion ? {
    /^4/    => '/var/log/puppetlabs/mcollective.log',
    default => '/var/log/mcollective.log',
  }

  $plugin_yaml = $::puppetversion ? {
    /^4/    => '/etc/mcollective/facts.yaml:/etc/puppetlabs/mcollective/facts.yaml',
    default => '/etc/mcollective/facts.yaml',
  }

  $port = '61613'
  $protocol = 'tcp'

  # General Settings
  $my_class = ''
  $source = ''
  $source_dir = ''
  $source_dir_purge = false
  $template = ''
  $options = ''
  $service_autorestart = true
  $version = 'present'
  $absent = false
  $disable = false
  $disableboot = false

  ### General module variables that can have a site or per module default
  $monitor = false
  $monitor_tool = ''
  $monitor_target = $::ipaddress
  $firewall = false
  $firewall_tool = ''
  $firewall_src = '0.0.0.0/0'
  $firewall_dst = $::ipaddress
  $puppi = false
  $puppi_helper = 'standard'
  $debug = false
  $audit_only = false

}
