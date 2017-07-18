require "spec_helper"
require "serverspec"

package = "virtualbox"
service = "vboxdrv"
user    = "vboxusers"
group   = "vboxusers"
kernel_modules = %w(vboxdrv vboxnetflt vboxnetadp)

case os[:family]
when "freebsd"
  package = "virtualbox-ose"
  service = "vboxnet"
  kernel_modules = %w(vboxdrv ng_vboxnetflt vboxnetadp)
when "ubuntu"
  if Gem::Version.new(os[:release]) <= Gem::Version.new("16.04")
    service = "virtualbox"
  end
when "redhat"
  package = "VirtualBox-5.1"
end

describe package(package) do
  it { should be_installed }
end

case os[:family]
when "freebsd"
  describe user(user) do
    it { should exist }
  end
end

describe group (group) do
  it { should exist }
end

kernel_modules.each do |m|
  describe kernel_module(m) do
    it { should be_loaded }
  end
end

describe service(service) do
  it { should be_enabled }
  it do
    pending "does not support status" if os[:family] == "freebsd"
    pending "specinfra checks running process" if os[:family] == "ubuntu" &&
                                                  Gem::Version.new(os[:release]) < Gem::Version.new("16.04")
    should be_running
  end
end
