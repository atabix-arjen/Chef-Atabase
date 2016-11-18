#script "Install Laravel" do
#  interpreter "bash"
#  user 'root'
#  code <<-EOH
#      (cd /var/www/ && composer create-project --prefer-dist laravel/laravel production && chown www-data:www-data -R production)
#  EOH
#end
node[:deploy].each do |application, deploy|
    cookbook_file '/etc/nginx/sites-enabled/production' do
        source 'laravel'
        mode 0644
        owner 'root'
        group 'root'
    end

    script "CHOWN " do
      interpreter "bash"
      user 'root'
      code <<-EOH
          (cd #{deploy[:deploy_to]}/releases/current && chown www-data:www-data -R *)
      EOH
    end

    script "Restart NGINX" do
      interpreter "bash"
      user 'root'
      code <<-EOH
          service nginx restart
      EOH
    end
end
