script "Run a script" do
  interpreter "bash"
  user 'root'
  code <<-EOH
      LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
      apt-get update
      apt-get install -y php7.0-fpm php7.0-common php7.0-mysql
  EOH
end