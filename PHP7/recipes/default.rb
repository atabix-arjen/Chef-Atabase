script "Install PHP7.0" do
  interpreter "bash"
  user 'root'
  code <<-EOH
      LC_ALL=en_US.UTF-8 add-apt-repository -y ppa:ondrej/php
      apt-get update
      apt-get install -y nginx php7.0-fpm php7.0-common php7.0-mysql php7.0-mbstring php7.0-mcrypt php7.0-xml php7.0-memcached php7.0-zip curl php7.0-curl php7.0-gd
      curl -sS https://getcomposer.org/installer | sudo php -- --install-dir=/usr/local/bin --filename=composer
      chmod +x /usr/local/bin/composer
      sed -i "/listen = .*/c\listen = 127.0.0.1:9000" /etc/php/7.0/fpm/pool.d/www.conf
      service php7.0-fpm restart
  EOH
end