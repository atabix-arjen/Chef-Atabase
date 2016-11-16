script "Run a script" do
  interpreter "bash"
  code <<-EOH
      LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
      apt-get update
  EOH
end